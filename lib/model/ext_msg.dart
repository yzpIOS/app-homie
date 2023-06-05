enum ExtType {
  a,
}

abstract class ImExtData {
  ExtType get type;

  Map<String, dynamic> toJson() => {'type': type};
}
