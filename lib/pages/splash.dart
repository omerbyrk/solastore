import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:incitter/consts.dart';
import 'package:incitter/helpers/notification.dart';
import 'package:incitter/helpers/onesignal_configurations.dart';

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
    OneSignalConfigurations.initPlatformState();
    NotificationHelper.init();
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
        ));
  }

  void navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 6));
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Navigator.of(context).pushReplacementNamed(AppConsts.NOT_ONLINE_ROUTE);
    } else {
      Navigator.of(context).pushReplacementNamed(AppConsts.HOME_ROUTE);
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
