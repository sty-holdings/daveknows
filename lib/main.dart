import 'dart:async';
import 'dart:developer';

import 'package:daveknows/index.dart';
import 'package:flutter/material.dart';
import 'package:framework/base_app.dart';
import 'package:framework/provider.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/environment.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/models/shared_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/navigator.dart';
import 'widgets/splash.dart';

Future<void> main() async {

  const targetEnv = String.fromEnvironment('env', defaultValue: Constants.LOCAL_ENV);
  // const targetEnv = String.fromEnvironment('env', defaultValue: Constants.DEVELOPMENT_ENV);
  // const targetEnv = String.fromEnvironment('env', defaultValue: Constants.DEMONSTRATION_ENV);
  // const targetEnv = String.fromEnvironment('env', defaultValue: Constants.PRODUCTION_ENV);

  runApp(MyApp(targetEnv:  targetEnv).createApp());
}

class MyApp extends BaseAppState {
  MyApp({required String targetEnv}) : super(DKSharedModel(navigator: DKNavigator(), theme: Constants.customTheme));
  var targetEnv = 'local';

  Future<void> downloadAssetsAndData() async {
    var env = String.fromEnvironment('env', defaultValue: targetEnv);
    final yaml = await Environment.getEnv(env);
    Constants.env = Environment.fromJson(env, yaml);
    await Constants.env.loadCertificate(yaml);
    (sharedModel as DKSharedModel).init();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final skipWelcomePage = prefs.getBool('skipWelcomePage') ?? false;
    (sharedModel as DKSharedModel).savedUserName = username ?? '';
    (sharedModel as DKSharedModel).skipWelcomePage = skipWelcomePage;
  }

  late FutureBuilder<dynamic>? _futurePage;

  @override
  void initState() {
    super.initState();
    _futurePage = FutureBuilder<dynamic>(
      future: downloadAssetsAndData(),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          log('snapshot error: ${snapshot.error}');
          return Scaffold(
            body: Center(
              child: sharedModel.isAuthorized
                  ? FixButton(
                      L10nApp.logout.$,
                      icon: Icons.lock_open_outlined,
                      onPressed: () {
                        (sharedModel as DKSharedModel).loginService.logout().whenComplete(() => goNext(ctx, Constants.NAV_LOGIN));
                      },
                    )
                  : Text(snapshot.error.toString(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if ((sharedModel as DKSharedModel).skipWelcomePage) {
            goNext(ctx, Constants.NAV_LOGIN);
          } else {
            goNext(ctx, Constants.NAV_INTRO);
          }
        }
        return const SplashWidget();
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        appWidget: this,
        sharedModel: sharedModel,
        child: MaterialApp(
            onGenerateRoute: sharedModel.navigator.onGenerateRoute as RouteFactory?,
            theme: sharedModel.theme,
            debugShowCheckedModeBanner: false,
            title: L10nApp.titleApp,
            locale: sharedModel.locale,
            supportedLocales: dkSettings.supportedLocales, // Provide a list of supported locales
            localizationsDelegates: [
              dkSettings.delegate, // Enable l10n_flutter delegate
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            home: _futurePage));
  }
}
