import 'package:flutter/material.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

class IntroPage extends BaseWidget {
  IntroPage(super.provider) : super(isWhitelist: true);

  @override
  Widget createScrollView(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.INTRO_PATH),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
          ),
        ),
        child: super.createScrollView(context));
  }

  @override
  Widget mainBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 40),
      alignment: Alignment.center,
      child: buildUI(context, Theme.of(context)),
    );
  }

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    const style = TextStyle(color: Constants.Pri_PurpleDeep, fontSize: 20);
    const styleName = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          width: double.infinity,
          height: 100,
          child: Text('"${L10nApp.welcome1}"',
              style: style, textAlign: TextAlign.center),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(L10nApp.welcome2.$, style: styleName),
        ),
        const SizedBox(
          height: 150,
        ),
        FixButton(
          L10nApp.accountExists.$,
          onPressed: () {
            goNext(Constants.NAV_LOGIN);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        FixButton(
          L10nApp.createAccount.$,
          onPressed: () {
            goNext(Constants.NAV_CREATE_ACCOUNT);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
