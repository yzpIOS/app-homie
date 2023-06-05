import 'package:flutter/material.dart';

import 'package:app/event/event.dart';

class MyTest {
  static void sendMessage({String code = "-1", required dynamic data}) {
    MyUnityEvent(code: code, data: data).fire();
  }

  static Widget createBtn({VoidCallback? onPressed}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed.call();
            return;
          }
        },
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: MaterialStateProperty.all(0),
          maximumSize: MaterialStateProperty.all(const Size(168, 40)),
          minimumSize: MaterialStateProperty.all(Size.zero),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
          ),
        ),
        child: const Text(
          "btn",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyUnityEvent extends Event {
  final dynamic data;
  final String code;

  MyUnityEvent({required this.code, this.data});
}
