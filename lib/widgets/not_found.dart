import 'package:flutter/material.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

class NotFoundWidget extends BaseWidget {
  NotFoundWidget(super.provider) : super(isWhitelist: true);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      alignment: Alignment.center,
      child: Text(L10nApp.pageNotFound.$),
    );
  }
}