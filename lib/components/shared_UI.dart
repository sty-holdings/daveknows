import 'package:flutter/material.dart';

class SharedUI {
  static Widget displayDivider(double left, double top, double right, double bottom) {
    return Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: const Divider(
          height: 5,
          thickness: 2,
          indent: 0,
          endIndent: 0,
          color: Colors.black26,
        ));
  }
}
