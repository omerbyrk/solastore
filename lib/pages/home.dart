import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
          withJavascript: true,
          bottomNavigationBar: _buildBottomNavigationBar(),
          url: "https://solastore.com.tr",
        ),
      ),
    );
  }

  String _getUrl({String path = ""}) {
    return "https://solastore.com.tr" + path;
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultTabController(
            length: 4,
            child: TabBar(
              onTap: (index) {
                switch (index) {
                  case 0:
                    flutterWebviewPlugin
                        .reloadUrl(_getUrl(path: "/Home/Index/"));
                    break;
                  case 1:
                    flutterWebviewPlugin
                        .reloadUrl(_getUrl(path: "/Home/Category/91"));
                    break;
                  case 2:
                    flutterWebviewPlugin
                        .reloadUrl(_getUrl(path: "/Home/Category/88"));
                    break;
                  case 3:
                    flutterWebviewPlugin
                        .reloadUrl(_getUrl(path: "/Home/Contact/"));
                    break;
                }
              },
              tabs: [
                Tab(
                  icon: Image.asset(
                    "assets/images/home.png",
                    width: 35,
                    height: 35,
                  ),
                ),
                Tab(
                    icon: Image.asset(
                  "assets/images/cok-satanlar.png",
                  width: 35,
                  height: 35,
                )),
                Tab(
                    icon: Image.asset(
                  "assets/images/etiket.png",
                  width: 35,
                  height: 35,
                )),
                Tab(
                    icon: Image.asset(
                  "assets/images/iletisim.png",
                  width: 35,
                  height: 35,
                )),
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

