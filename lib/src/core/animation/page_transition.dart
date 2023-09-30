import 'package:flutter/material.dart';

class NoAnimationTransition extends MaterialPageRoute {
  NoAnimationTransition(
      {required WidgetBuilder builder, RouteSettings? routeSettings})
      : super(builder: builder, maintainState: true, fullscreenDialog: false);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
    return child;
  }
}
