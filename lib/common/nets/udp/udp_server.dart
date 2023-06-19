
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/commons/utils/byte_buffer1.dart';
import 'package:app/common/nets/commons/utils/byte_utils.dart';
import 'package:app/common/nets/udp/client_session.dart';

class UdpServer with BaseClient {
  String validate_value = "z0Scs3wAMSdy170c5M8Q45FmX8P4GfGJDdzMpZ5nh02wZ8xheJS8KPA5fY3yPJre8zDBQJfwWPRHyz6f64m3ZsjWYp8AA0DZQ8YXn1QrFrhTi74x36rhN5nbQSADsG0t";

  // 是否接收服务端的广播
  bool _broadcastEnabled = false;
  // 订阅stream
  StreamSubscription? _streamSubscription;
  // udp server
  RawDatagramSocket? rawDatagramSocket;
  // 用户进来的连接，并且己经校验过的
  Map<String, ClientSession> clients = {};

  void bind(String host, int port, {bool broadcastEnabled = true, int tryTimes = 1000}) {
    _broadcastEnabled = broadcastEnabled;
    // 尝试次数
    if(tryTimes <= 0) {
      return;
    }
    RawDatagramSocket.bind(host, port)
        .then(_handleBindSuc)
        .onError((error, stackTrace) async {
          // 延迟60毫秒重新绑定
          await Future.delayed(const Duration(milliseconds: 60));
          // 重新绑定
          bind(host, port - 1, tryTimes: tryTimes - 1);
        });
  }

  // 处理绑定成功
  void _handleBindSuc(RawDatagramSocket udpSocket) {
    rawDatagramSocket = udpSocket;
    // 关闭之前的订阅
    _streamSubscription?.cancel();
    udpSocket.asBroadcastStream(onListen: (subscription) {
      _streamSubscription = subscription;
    }).listen((event) {
      // 是否接收服务端的广播
      udpSocket.broadcastEnabled = _broadcastEnabled;
      Datagram? dg = udpSocket.receive();
      if(dg == null) {
        return;
      }
      // 校验连接过来的数据
      if(!clients.containsKey(dg.address.address)) {
        // 校验连接过来的udp客户端, 校验成功，认为是连接成功
        Uint8List dataList = dg.data;
        ByteBuffer1 byteBuffer1 = ByteBuffer1();
        byteBuffer1.addBuffer(dataList);

        // 校验数据是否是合法
        Uint8List? resultData = byteBuffer1.getPackage();
        if(resultData == null) {
          return;
        }
        // 协仪号校验
        int cmd = byteBuffer1.getUnPackCmd();
        if(cmd != 3928) {
          return;
        }
        // 解密数据
        ByteUtils.decrypt(resultData);
        // 转化成字符串
        String value = String.fromCharCodes(resultData);
        if(value != validate_value) {
          return;
        }
        // 校验通过, 缓存起来
        ClientSession clientSession = ClientSession(port: dg.port, address: dg.address, udpSocket: udpSocket);
        clients[dg.address.address] = clientSession;

        // 发送成功数据
        clientSession.sendConnectSuc();
      } else {
        // 发送数据到client中处理
        clients[dg.address.address]?.onReceiveData(dg.data);
      }
    });
  }

  void dispose() {
    rawDatagramSocket = null;
    _streamSubscription?.cancel();
    _streamSubscription = null;
  }
}