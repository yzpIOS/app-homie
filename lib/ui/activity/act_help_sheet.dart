import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ActHelpSheet extends ISheetWidget {
  @override
  late final Widget title = const Text('玩法介绍');
  @override
  late final Tuple2<Widget, VoidCallback>? leading = null;
  @override
  late final Tuple2<Widget, VoidCallback>? trailing = closeBtn;

  ActHelpSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: Pad(horizontal: 10, vertical: 10, bottom: AppSize.safeBottom),
      child: Column(
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '一、玩法说明',
                  style: TextStyle(fontSize: 14, fontWeight: fw$Medium),
                ),
                TextSpan(text: '\n'),
                TextSpan(text: '1.参与玩法，需购买烟花道具免费获得参与次数开启幸运蛋，有机会获得对应礼物。'),
                TextSpan(text: '\n'),
                TextSpan(text: '2.每种礼物的获得概率随着总礼物数的变化浮动。'),
                TextSpan(text: '\n'),
                TextSpan(text: '3.当最大的礼物全部被获取时，礼物池会立即刷新恢复基础库存。'),
                TextSpan(text: '\n'),
                TextSpan(text: '\n'),
                TextSpan(
                  text: '二、特别提示',
                  style: TextStyle(fontSize: 14, fontWeight: fw$Medium),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                    text:
                        '1.用户通过该玩法获得的礼物仅限于在平台内使用，不得以任何形式兑换成法定货币、现金或其他任何具有交换价值的物品或服务；禁止主持、用户及其他第三方主体进行任何形式的礼物交易，否则一经查实，平台将严格按照平台规则对主持、用户采取包括但不限于封号、冻结交易、清空违规资产、终止服务等处罚措施，平台亦不保障前述交易的道具、权益及虚拟财产的有效性，主持、用户应自行承担法律责任及相关损失。请用户谨防上当受骗。'),
                TextSpan(text: '\n'),
                TextSpan(text: ' 2.平台可能在聊天室展示用户帐号信息及所获得的随机礼物等信息，您授权并同意平台为此使用并展示您的公开帐号信息（如头像、昵称等）及所获得的 随机礼物等信息。'),
                TextSpan(text: '\n'),
                TextSpan(text: '\n'),
                TextSpan(
                  text: '三、玩法奖励',
                  style: TextStyle(fontSize: 14, fontWeight: fw$Medium),
                ),
                TextSpan(text: '\n'),
                TextSpan(text: '幸运礼物及概率如下'),
              ],
            ),
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Spacing.h10,
          Image.asset(IMG.format('activity/说明'), scale: 2, fit: BoxFit.fitWidth),
          Spacing.h20,
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '四、重要须知',
                  style: TextStyle(fontSize: 14, fontWeight: fw$Medium),
                ),
                TextSpan(text: '\n'),
                TextSpan(text: '1.该玩法禁止未成年人参加，请适度参与，勿沉迷其中。'),
                TextSpan(text: '\n'),
                TextSpan(text: '2.本玩法旨在提升用户互动体验，仅供交流娱乐之目的。主持、用户及其他任何主体均不与任何非法目的与方式进行使用。'),
                TextSpan(text: '\n'),
                TextSpan(
                    text:
                        '3.禁止将获取的礼物实施任何影响互动公平性的行为，或利用产品BUG、使用外挂、插件、模拟器等不正当手法参与互动，一旦发生上述情况，平台有权取消发放对应奖励，追回奖励，对情节严重的，平台保留一切追究法律责任的权利。'),
                TextSpan(text: '\n'),
                TextSpan(text: '4.同一账号、同一手机号、同一个设备或同一个提现账户，均视为同一个用户，仅可获得一个参与活动资格。消费过程中请用户妥善保管好自己的账号、密码、手机验证码等登录凭证。'),
                TextSpan(text: '\n'),
                TextSpan(text: '5.活动期间，因用户操作不当或用户所在地网络、支付平台、电信运营商、第三方平台等故障或限制导致的用户无法参与活动或参与失败的，平台无需为此承担任何法律责任。'),
                TextSpan(text: '\n'),
                TextSpan(
                    text: '6.如因不可抗力、情势变更、相关政策变动、政府机关指令等原因导致本共功能玩法调整、暂停、或无法进行的，平台有权随时决定修改、暂停、取消或终止本功能玩法，并无需为此承担任何法律责任。'),
                TextSpan(text: '\n'),
                TextSpan(text: '7.欢迎用户积极向平台举报任何形式的违法违规、违反平台规则的行为，一经查证属实，将严肃处理，涉及违法犯罪的，平台将积极配合有关部门进行调查。'),
                TextSpan(text: '\n'),
                TextSpan(text: '8.平台保留在法律范围内对上述规则进行解释的权利。'),
                TextSpan(text: '\n'),
                TextSpan(text: '9.本活动与Apple inc无关。'),
              ],
            ),
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
