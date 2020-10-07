import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:incitter/helpers/globalconfigrations.dart';

class AdvertHelper {
  static final String _appID = Platform.isAndroid
      ? "ca-app-pub-3905858662822458~3426317574"
      : "ca-app-pub-3905858662822458~3063355490";
  static final String _adUnitID = Platform.isAndroid
      ? "ca-app-pub-3905858662822458/6379977492"
      : "ca-app-pub-3905858662822458/2213308252";

  static final MobileAdTargetingInfo _mobileAdTargetingInfo =
      new MobileAdTargetingInfo(
          keywords: ["football", "spor", "football-manager", "game"],
          nonPersonalizedAds: true);

  static void showIntersitial() {
    print("Hello world " +
        (_isTestMode ? InterstitialAd.testAdUnitId : _adUnitID) +
        " " +
        GlobalConfigurationHelper.getValue("admob_mode"));

    InterstitialAd interstitial = InterstitialAd(
        adUnitId: _isTestMode ? InterstitialAd.testAdUnitId : _adUnitID,
        targetingInfo: _mobileAdTargetingInfo,
        listener: (MobileAdEvent e) {
          print("listener $e");
        });
    interstitial
      ..load()
      ..show();
    interstitial.dispose();
  }

  static bool get _isTestMode =>
      GlobalConfigurationHelper.getValue("admob_mode") == "test";

  static void init() async {
    bool result = await FirebaseAdMob.instance.initialize(appId: _appID);
    print("Result Admob: " + result.toString());
  }
}
