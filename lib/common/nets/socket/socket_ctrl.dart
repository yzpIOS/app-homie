
import 'package:app/common/nets/socket/base_client.dart';
import 'package:app/common/nets/socket/server/custom_local_server.dart';
import 'package:app/tools/bus.dart';
import 'package:get/get.dart';

import 'client/custom_client.dart';


///
/// socket控制器
///
class SocketCtrl extends GetxController with BusGetLifeMixin, BaseClient {

  // flutter 内部的server, 用于与unity进行通信
  CustomLocalServer localServer = CustomLocalServer();
  // 分配给unity的唯一id
  String uniqueId = DateTime.now().toString();

  // client, 用于与后台通信
  CustomClient clientForgo = CustomClient();

  static SocketCtrl getCtrl() {
    return Get.find<SocketCtrl>();
  }

  @override
  void onInit() {
    super.onInit();
    // 初始化客户端socketserver, 用于与unity通仿
    localServer.bindServer();
    // 监听unity发送的消息
    localServer.onReceiveRawData((session, cmd, data) {
      if(session.uniqueId != uniqueId) {
        return;
      }
      // flutter与unity之间的协义号从20001开始
      // 大于20000的是unity发给flutter的信息
      if(cmd >= 20000) {
        // 通知flutter收到信息
        riseOnRawData(cmd, data);
        return;
      }
      // 发送数据到服务端
      clientForgo.sendBytes(cmd, datas: data);
    });
    // 监听unity发送的消息
    localServer.onReceiveDataFromU((session, cmd, data) {
      if(session.uniqueId != uniqueId) {
        return;
      }
      // 小于20000的不处理, 因为unity发给服务端的
      if(cmd <= 20000) {
        return;
      }
      // todo flutter与客户端的通信
      riseOnData(cmd, data);
    });

    on((event) async {
      // 获取到Unity的消息
    });

    // 接收到原始数据
    clientForgo.onRawData((cmd, data) {
      riseOnRawData(cmd, data);
      localServer.getSession(uniqueId)?.sendBytes(cmd, datas: data);
    });
    // 接收到反序列化后的数据
    clientForgo.onData((cmd, data) {
      riseOnData(cmd, data);
    });
  }

  ///
  /// 启动client
  void startClient(String host, int port) {
    clientForgo.connect(host, port);
  }

  @override
  void dispose() {
    super.dispose();
    clientForgo.dispose();
    localServer.dispose();
  }
}