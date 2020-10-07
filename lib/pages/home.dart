import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:incitter/helpers/advert.dart';
import 'package:incitter/helpers/my_flutter_app_icons.dart';
import 'package:permission_handler/permission_handler.dart';

import '../helpers/firebase_messaging.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permissionForAndroid();
    loadJS();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  void permissionForAndroid() async {
    print(await Permission.storage.isGranted);
    if (Platform.isAndroid && !(await Permission.storage.isGranted)) {
      await Permission.storage.request();
    }
  }

  void loadJS() async {
    var givenJS = rootBundle.loadString('assets/javascripts/index.js');
    return givenJS.then((String js) async {
      var firebaseToken =
          "var firebaseToken =' ${await FirebaseMessagingHelper.getToken}'; ";
      print(firebaseToken);
      flutterWebviewPlugin.onStateChanged.listen((viewState) async {
        if (viewState.type == WebViewState.finishLoad) {
          flutterWebviewPlugin.evalJavascript(firebaseToken + js);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          withJavascript: true,
          bottomNavigationBar: _buildBottomNavigationBar(),
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: 'Advertisement',
                onMessageReceived: (JavascriptMessage msg) {
                  AdvertHelper.showIntersitial();
                }),
            JavascriptChannel(
                name: 'Linkout',
                onMessageReceived: (JavascriptMessage msg) {
                  print("linkout");
                })
          ].toSet(),
          url: "https://loogips.com/",
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultTabController(
            length: 5,
            child: TabBar(
              onTap: (index) {
                switch(index) {
                  case 1: return;
                  case 2: return;
                  case 3: return;
                  case 4: return;
                  case 5: return;
                }
              },
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black87,
                  ),
                ),
                Tab(
                    icon: Icon(
                  Icons.star,
                  color: Colors.black87,
                )),
                Tab(icon: Icon(Icons.shopping_basket, color: Colors.black87)),
                Tab(icon: Icon(AppIcons.tag, color: Colors.black87)),
                Tab(icon: Icon(Icons.person, color: Colors.black87)),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (await flutterWebviewPlugin.canGoBack()) {
                      flutterWebviewPlugin.goBack();
                    }
                  },
                  child: Center(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (await flutterWebviewPlugin.canGoForward()) {
                      flutterWebviewPlugin.goForward();
                    }
                  },
                  child: Center(
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

/*,*/
/*WebView(
          initialUrl: "https://incitter.net/",
          javascriptMode: JavascriptMode.unrestricted,
          debuggingEnabled: false,
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: 'Advertisement',
                onMessageReceived: (JavascriptMessage msg) {
                  AdvertHelper.showIntersitial();
                })
          ].toSet(),
          onPageFinished: (String s) async {
            var firebaseToken =
                "var firebaseToken =' ${await FirebaseMessagingHelper.getToken}'; ";
            String javascripts =
                await rootBundle.loadString("assets/javascripts/index.js");
            this.cont.evaluateJavascript(firebaseToken + javascripts);
          },
          onWebViewCreated: (cont) {
            this.cont = cont;
          },
        ),*/

// ignore: must_be_immutable
