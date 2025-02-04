import 'package:achievex/provider/auth_provider.dart';
import 'package:achievex/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashProvider splashProvider = SplashProvider();
  @override
  void initState() {
    super.initState();
    changeDoc();
  }

  void changeDoc() {
    Future.delayed(
        const Duration(seconds: 3),
        () => {
              splashProvider.checkUserAuth(context),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(builder: (context, auth, child) {
      return Scaffold(
        body: Column(children: [
          Image.asset(
            'assets/images/frame-a.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          )
        ]),
      );
    });
  }
}
