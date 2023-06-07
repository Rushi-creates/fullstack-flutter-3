import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/Splash_stub/SplashScreen.dart';

NavigateToSplash(ctx, {bool doReplace = true}) {
  if (doReplace) {
    Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) {
      return const SplashScreen();
    }));

    //
  } else {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) {
      return const SplashScreen();
    }));
  }
}
