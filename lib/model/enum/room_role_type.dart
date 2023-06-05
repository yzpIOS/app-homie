enum RoomRoleType {
  owner('房'),
  manager('管');

  final String label;

  const RoomRoleType(this.label);
}

extension XRoomRoleType on RoomRoleType? {
  bool get isOwner => this == RoomRoleType.owner;

  bool get isManager {
    switch (this) {
      case null:
        return false;
      case RoomRoleType.owner:
      case RoomRoleType.manager:
        return true;
    }
  }
}
