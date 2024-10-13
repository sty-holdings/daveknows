import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:daveknows/index.dart';
import 'package:daveknows/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:framework/base_app.dart';
import 'package:framework/provider.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/environment.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/models/dk_shared_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/dk_aws_service.dart';
import 'components/fix_button.dart';
import 'components/navigator.dart';

void main() async {
  const targetEnv =
      String.fromEnvironment('env', defaultValue: Constants.LOCAL_ENV);
  // const targetEnv = String.fromEnvironment('env', defaultValue: Constants.DEVELOPMENT_ENV);
  // const targetEnv = String.fromEnvironment('env', defaultValue: Constants.DEMONSTRATION_ENV);
  // const targetEnv = String.fromEnvironment('env', defaultValue: Constants.PRODUCTION_ENV);
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await downloadAssetsAndData(targetEnv);
    await _configureAmplify();
    runApp(MyApp(targetEnv: targetEnv).createApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

Future<void> downloadAssetsAndData(String targetEnv) async {
  var env = String.fromEnvironment('env', defaultValue: targetEnv);
  Constants.env = await Environment.getEnv(env);
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

class MyApp extends BaseAppState {
  MyApp({required String targetEnv})
      : super(DKSharedModel(
            navigator: DKNavigator(), theme: Constants.customTheme));

  DKAWSService dkAWSService = DKAWSService();

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final skipWelcomePage = prefs.getBool('skipWelcomePage') ?? false;
    (sharedModel as DKSharedModel).savedEmail =
        email ?? ''; // prefs are saved in the sharedModel so they are global
    (sharedModel as DKSharedModel).skipWelcomePage =
        skipWelcomePage; // prefs are saved in the sharedModel so they are global
  }

  late FutureBuilder<dynamic>? _futurePage;

  @override
  void initState() {
    super.initState();
    _futurePage = FutureBuilder<dynamic>(
      future: _loadPreferences(),
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
                  dkAWSService.signOutCurrentUser().whenComplete(() => goNext(ctx, Constants.NAV_LOGIN));
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
