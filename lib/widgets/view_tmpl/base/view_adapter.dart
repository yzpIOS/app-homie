import 'package:flutter/material.dart';

abstract class ViewAdapter<T> extends StatelessWidget {
  final T vm;

  const ViewAdapter(this.vm, {super.key});
}
