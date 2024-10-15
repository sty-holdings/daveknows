import 'package:daveknows/models/DKSharedModel.dart';
import 'package:daveknows/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:daveknows/pages/home.dart';
import 'package:daveknows/pages/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final targetEnv = Constants.LOCAL_ENV;

  // final targetEnv = Constants.DEVELOPMENT_ENV;
  // final targetEnv = Constants.DEMONSTRATION_ENV;
  // final targetEnv = Constants.PRODUCTION_ENV;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DKSharedModelProvider>(
        create: (_) => DKSharedModelProvider(),
        child: Consumer<DKSharedModelProvider>(
            builder: (context, sharedModelProvider, child) {
          return FutureBuilder(
              future: sharedModelProvider.initApp(Constants.LOCAL_ENV),
              builder: (context, snapshot) {
                return MaterialApp(
                  title: Constants.APP_TITLE,
                  theme: ThemeData(
                    primarySwatch: Colors.purple,
                  ),
                  home: const SplashPage(),
                  routes: {
                    '/home': (context) => const HomePage(),
                    // '/login': (context) => LoginScreen(),
                    // '/register': (context) => RegisterScreen(),
                  },
                );
              });
        }));
  }
}
