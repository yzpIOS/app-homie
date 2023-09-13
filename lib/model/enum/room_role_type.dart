enum RoomRoleType {
  owner('房主'),
  manager('房管'),
  charge('主持');

  final String label;

  const RoomRoleType(this.label);
}

extension XRoomRoleType on RoomRoleType? {
  bool get isOwner => this == RoomRoleType.owner;

  bool get isManager {
    switch (this) {
      case null:
      case RoomRoleType.charge:
        return false;
      case RoomRoleType.owner:
      case RoomRoleType.manager:
        return true;
    }
  }
}
