
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

///
/// 一起玩
///
class HomePlayTogether extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "一起玩",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppPalette.txtDark
              ),
            ),

            const SizedBox(height: 3,),

            Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    IMG.format("convention_entry"),
                    width: 115,
                    height: 60,
                  ),
                ),

                const Positioned(
                  top: 19,
                  left: 10,
                  child: Column(
                    children: [
                      Text(
                        "逍遥岛",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppPalette.txtWhite
                        ),
                      ),

                      Text(
                        "开心交友",
                        style: TextStyle(
                            fontSize: 9,
                            color: AppPalette.txtWhite
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}