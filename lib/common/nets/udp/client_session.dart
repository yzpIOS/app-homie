
import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/nets/commons/byte_utils.dart';
import 'package:app/common/nets/udp/ByteBuffer2.dart';
import 'package:protobuf/protobuf.dart';
import 'package:app/common/nets/commons/base_client.dart';

class ClientSession with BaseClient {

  // 用户端口
  final int port;
  // 用户地址
  final InternetAddress address;
  final RawDatagramSocket udpSocket;
  /// 开始连接时间
  final startTime = DateTime.now().second;
  // 己经发送的列表数据
  final Map<int, Uint8List> sendedList = {};

  ClientSession({required this.port, required this.address, required this.udpSocket}) {
    serverByteBuffer = ByteBuffer2();
  }

  ///
  /// 接收到数据
  ///
  void onReceiveData(Uint8List data) {
    // 接收到数据
    onReceive(data);
    // 清理buffer
    serverByteBuffer.clearBuffer();
  }

  ///
  /// 处理包数据
  ///
  @override
  void handleResponse(curCmd, curPkg, message) {
    // 客户端接收成功
    int curUdpIndex = serverByteBuffer.getUdpPkgIndex();
    // 己经接收到数据，删除数据
    if(sendedList.containsKey(curUdpIndex)) {
      sendedList.remove(curUdpIndex);
    }
  }

  ///
  /// udp校验成功，回应给客户端
  ///
  void sendConnectSuc() {
    send(1001);
  }

  ///
  /// 发送数据
  ///
  bool send(int cmd, {GeneratedMessage? message}) {
    return sendBytes(cmd, datas: message?.writeToBuffer());
  }

  ///
  /// 发送数据
  /// C_Role c_role = C_Role(session: "家武，家武，收到请回答！");
  /// CustomClient.ins.sendBytes(6666, datas: c_role.writeToBuffer());
  ///
  bool sendBytes(int cmd, {Uint8List? datas}) {
    int len = datas?.length ?? 0;
    // 加密
    ByteUtils.encryption(datas);
    // 发送数据
    int udpIndex = DateTime.now().millisecond;
    // 数据封装
    datas = Uint8List.fromList([
      // 32位整数，转化成二进制数据
      (len >> 24).toUnsigned(8), (len >> 16).toUnsigned(8), (len >> 8).toUnsigned(8), (len).toUnsigned(8),
      // 32位整数，转化成二进制数据
      (cmd >> 24).toUnsigned(8), (cmd >> 16).toUnsigned(8), (cmd >> 8).toUnsigned(8), (cmd).toUnsigned(8),
      // 32位整数，转化成二进制数据
      (udpIndex >> 24).toUnsigned(8), (udpIndex >> 16).toUnsigned(8), (udpIndex >> 8).toUnsigned(8), (udpIndex).toUnsigned(8),...(datas ?? [])
    ]);
    // 缓存己发送的数据
    sendedList[udpIndex] = datas;
    return sendBytes2(datas);
  }

  ///
  /// 发送二进制
  ///
  bool sendBytes2(Uint8List? datas) {
    if(datas == null) {
      return false;
    }
    try {
      udpSocket.send(datas, address, port);
    } catch(e) {
      return false;
    }
    return true;
  }

  ///
  /// 大于6秒没有回应，就重发
  /// 大于12秒没有回应，就删除包
  ///
  void checkTimeOut() {
    // 6秒后重发一次，
    int interval = 1000;
    Future.delayed(Duration(milliseconds: interval)).asStream().listen((event) {
      int nowSeconds = DateTime.now().millisecond;
      List<int> updIndexes = sendedList.keys.toList();
      for(int index = updIndexes.length - 1; index >= 0; index --) {
        if(nowSeconds - updIndexes[index] >= 12 * interval) {
          // 重发了一次，还是没有收到数据，就删除包
          sendedList.remove(updIndexes[index]);
        } else if(nowSeconds - updIndexes[index] >= 6 * interval) {
          // 如果一个周期内没有收到数据, 重发数据
          sendBytes2(sendedList[updIndexes[index]]);
        }
      }
    }).onError((error) async {
      checkTimeOut();
    });
  }

  @override
  void dispose() {
    super.dispose();
    sendedList.clear();
  }
}