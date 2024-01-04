
import 'package:app/net/api.dart';

class Statistic {

  ///
  /// 1、启动App完成(C1):	时间戳, 用户ID,  平台ID, 渠道
  ///
  static void launch() {
    Api.Data.create(1);
  }

  ///
  /// 2、用户登入App(C2): 	时间戳, 用户ID, 平台ID, 渠道
  ///
  static void login() {
    Api.Data.create(1);
  }

  ///
  /// 3、用户登出App(C3):  (后台监控掉线,或失连用户十分钟后二次判定  app不作处理)	时间戳, 用户ID, 平台ID, 渠道
  ///
  static void logout() {
    Api.Data.create(1);
  }

  ///
  /// 4、App注销用户(C4):  (后台处理结果后记录 app不作处理)	时间戳, 用户ID , 平台ID, 渠道
  ///
  static void unRegist() {
    Api.Data.create(1);
  }

  ///
  /// 5、用户创建角色成功(C5):	平台ID, 渠道、时间戳, 用户ID, 角色ID, 角色名[, 性别]
  ///
  static void userCreate() {
    Api.Data.create(1);
  }

  ///
  /// 6、用户角色进入直播间(C6):  时间戳, 用户ID, 角色ID, 角色名, 房间ID, 房间名
  ///
  static void userEnterRoom() {
    Api.Data.create(1);
  }

  ///
  /// 7、用户角色退出直播间(C7):  (后台监控掉线,或失连用户十分钟后二次判定  app不作处理)	时间戳, 用户ID, 角色ID, 角色名, 房间ID, 房间名
  ///
  static void userExitRoom() {
    Api.Data.create(1);
  }

  ///
  /// 8、用户创建直播间(C8): 	时间戳, 用户ID,房间ID, 房间名, 房间描述
  ///
  static void userCreateRoom() {
    Api.Data.create(1);
  }

  ///
  /// 9、户充值发起(选择相应充值档)(C9):	时间戳, 用户ID, 充值订单ID, 描述("充值发起"), [支付类型]
  ///
  static void userCharge() {
    Api.Data.create(1);
  }


  ///
  /// 10、用户充值支付唤起(C10):	时间戳, 用户ID, 订单编号, 订单ID, 订单描述 (支付结果或三方平台反馈结果), 支付类型
  ///
  static void risePay() {
    Api.Data.create(1);
  }


  ///
  /// 11、用户充值支付成功(C11):	时间戳, 用户ID, 订单编号, 订单ID, 订单描述 (支付结果或三方平台反馈结果), 支付类型
  ///
  static void paySuccess() {
    Api.Data.create(1);
  }



  ///
  /// 12、用户充值支付失败(C12):	时间戳, 用户ID, 订单编号, 订单ID, 订单描述 (支付结果或三方平台反馈结果), 支付类型
  ///
  static void payFail() {
    Api.Data.create(1);
  }


  ///
  /// 13、用户充值支付取消(C13):	时间戳, 用户ID, [订单编号,] 订单ID, [订单描述 (支付结果或三方平台反馈结果)], 支付类型, 描述("充值取消")
  ///
  static void cancelPay() {
    Api.Data.create(1);
  }
}