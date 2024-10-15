import 'package:daveknows/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:daveknows/models/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(Constants.INTRO_IMAGE_PATH),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.4), BlendMode.darken),
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: Center(
                child: Image.asset(Constants.LOGO_PATH),
              ),
            ),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
