import 'package:flutter/cupertino.dart';

class AppVerticalFadeAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final bool downToUp;

  const AppVerticalFadeAnimation(
      {Key key,
      this.duration = const Duration(seconds: 1),
      this.curve = Curves.easeOut,
      this.child,
      this.downToUp = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: this.duration,
        curve: this.curve,
        builder: (_, doubleValue, child) {
          return Transform.translate(
              offset:
                  Offset(0.0, (doubleValue - 1) * ((downToUp ? -1 : 1) * 50)),
              child: Opacity(
                child: child,
                opacity: doubleValue,
              ));
        },
        child: this.child);
  }
}
