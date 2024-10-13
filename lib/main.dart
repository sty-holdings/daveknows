import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:daveknows/index.dart';
import 'package:flutter/material.dart';
import 'package:framework/base_app.dart';
import 'package:framework/provider.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/environment.dart';
import 'package:daveknows/models/locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/dk_aws_service.dart';
import 'components/navigator.dart';
import 'models/dk_shared_model.dart';
import 'widgets/splash.dart';

void main() {
  runApp(MyApp().createApp());
}

class MyApp extends BaseAppState {

  final targetEnv = Constants.LOCAL_ENV;
  // final targetEnv = Constants.DEVELOPMENT_ENV;
  // final targetEnv = Constants.DEMONSTRATION_ENV;
  // final targetEnv = Constants.PRODUCTION_ENV;

  MyApp()
      : super(DKSharedModel(
            navigator: DKNavigator(), theme: Constants.customTheme));

  Future<void> _initApp() async {
    await _loadEnvironmentFile();
    _configureAmplify();
    _loadPreferences();
  }

  Future<void> _loadEnvironmentFile() async {
    Constants.env = await Environment.getEnv(targetEnv);
  }

  Future<void> _configureAmplify() async {
    String amplifyOutput = '';
    try {
      amplifyOutput = jsonEncode(Constants.env.amplifyOutput);
    } catch (e) {
      log(e.toString());
    }
    try {
      await Amplify.addPlugins([AmplifyAuthCognito()]);
      await Amplify.configure(amplifyOutput);
      log('Amplify successfully configured');
    } on Exception catch (e) {
      log('Error configuring Amplify: $e');
    }
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final skipWelcomePage = prefs.getBool('skipWelcomePage') ?? false;
    (sharedModel as DKSharedModel).savedEmail = username ?? '';
    (sharedModel as DKSharedModel).skipWelcomePage = skipWelcomePage;
  }

  late FutureBuilder<dynamic>? _futurePage;

  @override
  void initState() {
    super.initState();
    _futurePage = FutureBuilder<dynamic>(
      future: _initApp(),
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
                        // (sharedModel as DKSharedModel).loginService.logout().whenComplete(() => goNext(ctx, Constants.NAV_LOGIN));
                        // dkAWSService.signOutCurrentUser().whenComplete(
                        //     () => goNext(ctx, Constants.NAV_LOGIN));
                      },
                    )
                  : Text(snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red)),
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
        sharedModel: DKSharedModel(navigator: DKNavigator(), theme: Constants.customTheme),
        child: MaterialApp(
            onGenerateRoute:
                sharedModel.navigator.onGenerateRoute as RouteFactory?,
            theme: sharedModel.theme,
            debugShowCheckedModeBanner: false,
            title: L10nApp.titleApp,
            locale: sharedModel.locale,
            supportedLocales: dkSettings.supportedLocales,
            // Provide a list of supported locales
            localizationsDelegates: [
              dkSettings.delegate, // Enable l10n_flutter delegate
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            home: _futurePage));
  }
}
