import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/model/const_assets.dart';
import 'package:daveknows/model/const_marketing.dart';
import 'package:daveknows/model/const_navigation.dart';
import 'package:daveknows/model/dk_language.dart';
import 'package:daveknows/model/dk_themes.dart';

import '/model/flutter_flow_util.dart';
import '/model/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'intro_page_model.dart';
export 'intro_page_model.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late IntroPageModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  width: double.infinity,
                  height: 100,
                  child: Text('"${DkLanguage.alanTuringQuote1}"',
                      style: DKThemes.quoteLargeWhite),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(DkLanguage.alanTuringAuthor.$, style: DKThemes.quoteMediumWhite),
                ),
                const SizedBox(
                  height: 150,
                ),
                FixButton(
                  DkLanguage.accountExists.$,
                  onPressed: () {
                      // goNext(ConstNavigation.NAV_LOGIN);
                    },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FixButton(
                  DkLanguage.createAccount.$,
                  onPressed: () {
                    // goNext(ConstNavigation.NAV_CREATE_ACCOUNT);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}
