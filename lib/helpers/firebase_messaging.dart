import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:incitter/helpers/notification.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print("myBackgroundMessageHandler: $message");
  NotificationHelper.show(
      1, message["notification"]["title"], message["notification"]["body"]);
}

class FirebaseMessagingHelper {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static void init() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        NotificationHelper.show(1, message["notification"]["title"],
            message["notification"]["body"]);
        print("onMessage: $message");
      },
      onBackgroundMessage:
          Platform.isAndroid ? myBackgroundMessageHandler : null,
    );
  }

  static Future<String> get getToken => _firebaseMessaging.getToken();
}
