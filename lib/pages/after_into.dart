import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incitter/components/app_vertical_fade_animation.dart';
import 'package:incitter/consts.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class AfterIntroScreen extends StatefulWidget {
  @override
  _AfterIntroScreenState createState() => _AfterIntroScreenState();
}

class _AfterIntroScreenState extends State<AfterIntroScreen> {
  ButtonState buttonState = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdab9fc),
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
        child: ListView(
          children: <Widget>[
            AppVerticalFadeAnimation(
              downToUp: false,
              duration: Duration(milliseconds: 1000),
              child: GestureDetector(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(
                  "assets/images/intro/intro9.gif",
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                ),
              )),
            ),
            AppVerticalFadeAnimation(
              duration: Duration(milliseconds: 1000),
              child: Container(
                child: Text(
                  "LOOGİPS",
                  style: _titleTextStyle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ),
            AppVerticalFadeAnimation(
              duration: Duration(milliseconds: 1250),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Kalbine dokunanları hisset.",
                          style: _contentTextStyle),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Hissettiklerini paylaş.",
                          style: _contentTextStyle),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Paylaştıklarınla kazan.", style: _contentTextStyle),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppVerticalFadeAnimation(
              duration: Duration(milliseconds: 1500),
              child: Center(
                child: ProgressButton.icon(
                  iconedButtons: {
                    ButtonState.idle: IconedButton(
                        text: "Özgürlük Vadisine Giriş Yap",
                        icon: Icon(Icons.fingerprint, color: Colors.white),
                        color: Color(0xff620378)),
                    ButtonState.loading: IconedButton(
                        text: "Bekleyin...", color: Color(0xffc499f0)),
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
                  maxWidth: MediaQuery.of(context).size.width * .8,
                  onPressed: () async {
                    setState(() {
                      buttonState = ButtonState.loading;
                    });

                    await Future.delayed(Duration(milliseconds: 1500));
                    Navigator.of(context)
                        .pushReplacementNamed(AppConsts.HOME_ROUTE);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _contentTextStyle => GoogleFonts.varelaRound(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

  TextStyle get _titleTextStyle => GoogleFonts.varelaRound(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      decoration: TextDecoration.none);
}
