import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incitter/consts.dart';
import 'package:incitter/pages/linkout.dart';

import 'pages/after_into.dart';
import 'pages/home.dart';
import 'pages/intro.dart';
import 'pages/not_online.dart';
import 'pages/splash.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  runApp(MaterialApp(
    initialRoute: AppConsts.SPLASH_ROUTE,
    routes: {
      AppConsts.SPLASH_ROUTE: (_) => SplashScreen(),
      AppConsts.HOME_ROUTE: (_) => HomeScreen(),
      AppConsts.NOT_ONLINE_ROUTE: (_) => NotOnlineScreen(),
      AppConsts.INTRO_ROUTE: (_) => IntroScreen(),
      AppConsts.AFTER_INTRO_ROUTE: (_) => AfterIntroScreen(),
      AppConsts.LINKOUT: (_) => LinkoutScreen()
    },
    debugShowCheckedModeBanner: false,
  ));
}
