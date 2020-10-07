import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class NotificationHelper {
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void init() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings("app_icon");
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    print(title);
  }

  static Future<void> show(int id, String title, String body) async {
    //var imageLocalPath = await _downloadAndSaveFile(imageURL, 'largeIcon');
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "Channel_ID", "channel name", "channel description",
        importance: Importance.Max,
        priority: Priority.High,
        ticker: "test ticker");

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
        id, title, body, platformSpecifics);
  }

  static Future<String> _downloadAndSaveFile(
      String url, String fileName) async {
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var response = await http.get(url);
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
