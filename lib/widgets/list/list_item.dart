import 'package:flutter/material.dart';

abstract class ListItem<T> extends StatelessWidget {
  final T item;

  ListItem(this.item, {Key? key}) : super(key: key ?? ValueKey(item));
}
