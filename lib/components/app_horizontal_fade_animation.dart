import 'package:flutter/cupertino.dart';

class AppHorizontalFadeAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final bool leftToRight;

  const AppHorizontalFadeAnimation(
      {Key key,
      this.duration = const Duration(seconds: 1),
      this.curve = Curves.easeOut,
      this.child,
      this.leftToRight = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: this.duration,
        curve: this.curve,
        builder: (_, doubleValue, child) {
          return Transform.translate(
              offset: Offset(
                  (doubleValue - 1) * ((leftToRight ? -1 : 1) * 50), 0.0),
              child: Opacity(
                child: child,
                opacity: doubleValue,
              ));
        },
        child: this.child);
  }
}
