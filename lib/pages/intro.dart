import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:incitter/components/app_horizontal_fade_animation.dart';
import 'package:incitter/components/app_vertical_fade_animation.dart';
import 'package:incitter/consts.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  Function goToTab;
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "LOOGİPS",
        styleTitle: GoogleFonts.varelaRound(
            fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        description:
            "Yazarak paramı kazanmak istiyorsun?\n O zaman doğru yerdesin.\n \n Hemen özgürlüğe yelken aç.",
        styleDescription: GoogleFonts.varelaRound(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
        pathImage: "assets/images/intro/intro1.gif",
      ),
    );
    slides.add(
      new Slide(
        title: "KEŞFET; ETKİLEŞİM; TAKİP ET",
        styleTitle: GoogleFonts.varelaRound(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            decoration: TextDecoration.underline),
        description:
            "Tüm gönderileri tek çatı altından izleyebilirsin;Paylaşılanları yorumlayarak, başka insanlara aktarıp, etkileşim alabilirsin;Bu sayede kendin gibi düşünen insanları takip edebilirsin",
        styleDescription: GoogleFonts.varelaRound(
            fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
        pathImage:
            "assets/images/intro/intro2.gif;assets/images/intro/intro4.gif;assets/images/intro/intro5.gif",
      ),
    );
    slides.add(
      new Slide(
        title: "TUZAK KUR; PUSUDA KAL; YAZARAK PARA KAZAN",
        styleTitle: GoogleFonts.varelaRound(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            decoration: TextDecoration.underline),
        description:
            "Bi takım gönderim deneyleri yaparak hoşlandığın kişinin, size olan duygularını açığa çıkarmasına yol açabilirsin;Gönderimden sonra keyifle olta başında pusarak karşıdan gelen hareketleri gözlemleyebilirsin;Yazarak veya gönderiler paylaşarak para kazanabilirsin. Özgürce yaz, Yazdıkça Kazan, Kazandıkça Paylaş.",
        styleDescription: GoogleFonts.varelaRound(
            fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
        pathImage:
            "assets/images/intro/intro6.gif;assets/images/intro/intro7.gif;assets/images/intro/intro8.gif",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    tabs.add(buildSlide1(slides[0]));
    tabs.add(buildSlide2(slides[1]));
    tabs.add(buildSlide2(slides[2]));
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: IntroSlider(
        // List slides
        slides: slides,

        // Skip button
        renderSkipBtn: this.renderSkipBtn(),
        colorSkipBtn: Color(0x33f0ae2c),
        highlightColorSkipBtn: Color(0x77f0ae2c),

        // Next button
        renderNextBtn: this.renderNextBtn(),

        // Done button
        renderDoneBtn: this.renderDoneBtn(),
        onDonePress: this.onDonePress,
        colorDoneBtn: Color(0x33f0ae2c),
        highlightColorDoneBtn: Color(0x77f0ae2c),

        // Dot indicator
        colorDot: Color(0x99f0ae2c),
        sizeDot: 13.0,
        typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

        // Tabs
        listCustomTabs: this.renderListCustomTabs(),
        refFuncGoToTab: (refFunc) {
          this.goToTab = refFunc;
        },

        // Show or hide status bar
        shouldHideStatusBar: true,
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushNamed(AppConsts.AFTER_INTRO_ROUTE);
  }

  Widget renderNextBtn() {
    return AppVerticalFadeAnimation(
      curve: Curves.bounceOut,
      child: Icon(
        Icons.navigate_next,
        color: Color(0xfff0ae2c),
        size: 35.0,
      ),
    );
  }

  Widget renderDoneBtn() {
    return AppVerticalFadeAnimation(
      curve: Curves.bounceOut,
      child: Icon(
        Icons.done,
        color: Color(0xfff0ae2c),
      ),
    );
  }

  Widget renderSkipBtn() {
    return AppVerticalFadeAnimation(
      curve: Curves.bounceOut,
      child: Icon(
        Icons.skip_next,
        color: Color(0xfff0ae2c),
      ),
    );
  }

  Widget buildSlide1(Slide slide) {
    return Container(
      color: Color(0xff3c1b79),
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
                  slide.pathImage,
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
                  slide.title,
                  style: slide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ),
            AppVerticalFadeAnimation(
              duration: Duration(milliseconds: 1250),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: RichText(
                  textScaleFactor: 1,
                  textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: true,
                      applyHeightToLastDescent: true),
                  text: TextSpan(
                    text: slide.description,
                    style: slide.styleDescription,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlide2(Slide slide) {
    List<String> titles = slide.title.split(";");
    List<String> descriptions = slide.description.split(";");
    List<String> imagePaths = slide.pathImage.split(";");
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            imagePaths.length,
            (index) => AppHorizontalFadeAnimation(
              leftToRight: index.isEven,
              child: Container(
                padding: const EdgeInsets.only(top: 25),
                child: index.isEven
                    ? Row(
                        children: [
                          Image.asset(
                            imagePaths[index],
                            width: 145,
                            height: 145,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    titles[index],
                                    style: slide.styleTitle,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: descriptions[index],
                                        style: slide.styleDescription),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    titles[index],
                                    style: slide.styleTitle,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: descriptions[index],
                                        style: slide.styleDescription),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            imagePaths[index],
                            width: 145,
                            height: 145,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
