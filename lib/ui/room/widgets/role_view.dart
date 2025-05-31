import 'package:app/common/theme.dart';
import 'package:app/model/enum/room_role_type.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoleView extends StatelessWidget {
  final RoomRoleType? role;

  const RoleView({super.key, this.role});

  @override
  Widget build(BuildContext context) {
    final role = this.role;

    return SizedBox(
      width: 34,
      height: 16,
      child: role == null
          ? null
          : Container(
              decoration: BoxDecoration(color: AppPalette.primary, borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: XText(
                role.label,
                style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: fw$Medium, height: 1),
              ),
            ),
    );
  }
}
