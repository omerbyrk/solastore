//

import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'notification.dart';

class OneSignalConfigurations {
  static Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    var settings = {
      OSiOSSettings.autoPrompt: true,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      if (!notification.shown) {
        NotificationHelper.show(notification.androidNotificationId,
            notification.payload.title, notification.payload.body);
      }
    });

    await OneSignal.shared
        .init("392d25ba-fa1b-4805-be11-9318175531bd", iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    OneSignal.shared.consentGranted(true);
  }
}
