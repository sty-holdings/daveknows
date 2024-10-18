import 'package:cached_network_image/cached_network_image.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/model/const_assets.dart';
import 'package:daveknows/model/const_marketing.dart';
import 'package:daveknows/model/const_navigation.dart';
import 'package:daveknows/model/const_assets.dart';
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

  ImageProvider getImageProvider() {
    return const CachedNetworkImageProvider(
      ConstAssets.INTRO_PAGE_BACKGROUND_PATH,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: getImageProvider(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      width: double.infinity,
                      height: 125,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        // Add 8 pixels of padding on all sides
                        child: Text('"${DkLanguage.alanTuringQuote1}"',
                            style: DKThemes.quoteMediumBlack),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(DkLanguage.alanTuringAuthor.$,
                          style: DKThemes.quoteMediumWhite),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FixButton(
                      DkLanguage.accountExists.$,
                      onPressed: () {
                        // goNext(ConstNavigation.NAV_LOGIN);
                      },
                      style: DKThemes.primaryButtonLargeBlackOnWhite,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FixButton(
                      DkLanguage.createAccount.$,
                      onPressed: () {
                        // goNext(ConstNavigation.NAV_LOGIN);
                      },
                      style: DKThemes.primaryButtonLargeBlackOnWhite,
                    ),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
