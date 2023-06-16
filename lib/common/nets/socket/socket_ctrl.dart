import 'package:app/common/nets/socket/base_client.dart';
import 'package:app/common/nets/socket/client/custom_client.dart';
import 'package:app/common/nets/socket/server/custom_local_server.dart';
import 'package:app/env.dart';
import 'package:app/tools/bus.dart';
import 'package:get/get.dart';


const FLUTTER_UINITY_START = 20000;
const FLUTTER_UINITY_END = 21000;

///
/// socket控制器
///
class SocketCtrl extends GetxController with BusGetLifeMixin, BaseClient {

  // client, 用于与后台通信
  final CustomClient _client = CustomClient();

  // 分配给unity的唯一id
  String uniqueId = DateTime.now().toString();
  // flutter 内部的server, 用于与unity进行通信
  final CustomLocalServer _localServer = CustomLocalServer();

  static SocketCtrl getCtrl() {
    return Get.find<SocketCtrl>();
  }

  @override
  void onInit() {
    super.onInit();
    // 初始化客户端socketserver, 用于与unity通仿
    _localServer.bindServer();
    // 监听unity发送的消息
    _localServer.onReceiveRawData((session, cmd, data) {
      if(session.uniqueId != uniqueId) {
        return;
      }
      // flutter与unity之间的协义号从20001开始
      // 大于20000的是unity发给flutter的信息
      if(cmd >= FLUTTER_UINITY_START || cmd <= FLUTTER_UINITY_END) {
        // 通知flutter收到信息
        riseOnRawData(cmd, data);
        return;
      }
      // 发送数据到服务端
      _client.sendBytes(cmd, datas: data);
    });
    // 监听unity发送的消息
    _localServer.onReceiveDataFromU((session, cmd, data) {
      if(session.uniqueId != uniqueId) {
        return;
      }
      // 小于20000的不处理, 因为unity发给服务端的
      if(cmd < FLUTTER_UINITY_START || cmd > FLUTTER_UINITY_END) {
        return;
      }
      // flutter与客户端的通信
      riseOnData(cmd, data);
    });
    // 开心跳心检查
    _localServer.beatHeartCheck();

    // 接收到原始数据
    _client.onRawData((cmd, data) {
      riseOnRawData(cmd, data);
      _localServer.getSession(uniqueId)?.sendBytes(cmd, datas: data);
    });
    // 接收到反序列化后的数据
    _client.onData((cmd, data) {
      riseOnData(cmd, data);
    });
  }

  Future<int> getLocalServerPort() async {
    return _localServer.getPortAsync();
  }

  void addServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    _localServer.addServerStatusCallBacks(serverStatusCallBacks);
  }

  void removeServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    _localServer.removeServerStatusCallBacks(serverStatusCallBacks);
  }

  ///
  /// 启动client
  ///
  void startClient(String host, int port) {
    _client.connect(host, port);
  }

  ///
  /// 更新时间
  ///
  void updateUniqueId() {
    uniqueId = DateTime.now().toString();
  }

  @override
  void dispose() {
    super.dispose();
    _client.dispose();
    _localServer.dispose();
  }
}