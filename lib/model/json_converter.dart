
import 'dart:ffi';

import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MyJsonConverter implements JsonConverter<Int64, dynamic> {
  const MyJsonConverter();


  @override
  Int64 fromJson(json) {
    return Int64(json);
  }

  @override
  toJson(Int64 object) {
    return object;
  }
}