import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incitter/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/advert.dart';
import '../helpers/firebase_messaging.dart';
import '../helpers/globalconfigrations.dart';
import '../helpers/notification.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _heigth = 1;
  double _weight = 1;
  double _end = 0.0;
  @override
  void initState() {
    NotificationHelper.init();
    FirebaseMessagingHelper.init();
    AdvertHelper.init();
    GlobalConfigurationHelper.init();
    navigateToHomeScreen();
    runAnimations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SafeArea(
              child: AnimatedContainer(
                width: _heigth,
                height: _weight,
                duration: Duration(milliseconds: 6500),
                curve: Curves.elasticOut,
                child: Image.asset(
                  'assets/images/app_icon.png',
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: _end),
        duration: Duration(milliseconds: 2000),
        builder: (_, value, child) {
          return Opacity(
            child: child,
            opacity: value,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("from",
                  style: GoogleFonts.varelaRound(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
            ),
            Image.asset(
              'assets/images/app_signature.png',
              scale: 7,
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  void navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 6));
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Navigator.of(context).pushReplacementNamed(AppConsts.NOT_ONLINE_ROUTE);
    } else {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      if (sharedPreferences.containsKey(AppConsts.INTRO_SHOWED_KEY)) {
        Navigator.of(context).pushReplacementNamed(AppConsts.HOME_ROUTE);
      } else {
        sharedPreferences.setBool(AppConsts.INTRO_SHOWED_KEY, true);
        Navigator.of(context).pushReplacementNamed(AppConsts.INTRO_ROUTE);
      }
    }
  }

  void runAnimations() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _heigth = 170;
      _weight = 170;
    });
    await Future.delayed(Duration(milliseconds: 1900));
    setState(() {
      _end = 1.0;
    });
  }
}
