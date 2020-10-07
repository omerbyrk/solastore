import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incitter/consts.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class NotOnlineScreen extends StatefulWidget {
  @override
  _NotOnlineScreenState createState() => _NotOnlineScreenState();
}

class _NotOnlineScreenState extends State<NotOnlineScreen> {
  ButtonState buttonState = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "İnternet bağlantınızı kontrol ediniz",
                  style: GoogleFonts.rubik(color: Colors.black, fontSize: 25),
                )),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: ProgressButton.icon(
              iconedButtons: {
                ButtonState.idle: IconedButton(
                    text: "Yeniden Dene",
                    icon: Icon(Icons.refresh, color: Colors.white),
                    color: Colors.blue.shade400),
                ButtonState.loading:
                    IconedButton(text: "Loading", color: Colors.blue.shade500),
                ButtonState.fail: IconedButton(
                    text: "Bağlanılamadı",
                    icon: Icon(Icons.cancel, color: Colors.white),
                    color: Colors.red.shade300),
                ButtonState.success: IconedButton(
                    text: "Bağlanıldı",
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    color: Colors.green.shade400)
              },
              state: buttonState,
              onPressed: () async {
                setState(() {
                  buttonState = ButtonState.loading;
                });
                var connectivityResult =
                    await (Connectivity().checkConnectivity());
                await Future.delayed(Duration(seconds: 1));
                if (connectivityResult != ConnectivityResult.none) {
                  setState(() {
                    buttonState = ButtonState.success;
                  });
                  await Future.delayed(Duration(milliseconds: 900));
                  Navigator.of(context)
                      .pushReplacementNamed(AppConsts.HOME_ROUTE);
                } else {
                  setState(() {
                    buttonState = ButtonState.fail;
                  });
                  await Future.delayed(Duration(seconds: 2000));
                  setState(() {
                    buttonState = ButtonState.idle;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
