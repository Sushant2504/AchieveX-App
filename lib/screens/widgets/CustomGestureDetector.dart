import 'package:flutter/cupertino.dart';

class CustomGestureDetector extends StatelessWidget {
  static const int AXIS_X = 0;
  static const int AXIS_Y = 1;
  static const int AXIS_BOTH = 2;

  final int axis;
  final Widget child;
  final double velocity;
  final Function onSwipeUp;
  final Function onSwipeDown;
  final Function onSwipeLeft;
  final Function onSwipeRight;

  const CustomGestureDetector({super.key, 
    required this.child,
    required this.velocity,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    required this.onSwipeUp,
    required this.onSwipeDown,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onPanEnd: (details) {
          Offset v = details.velocity.pixelsPerSecond;

          try {
            if ((axis == AXIS_Y) || axis == AXIS_BOTH) {
              if (v.dy > velocity) {
                onSwipeDown();
              } else if (v.dy < -velocity) {
                onSwipeUp();
              }
            }

            if ((axis == AXIS_X) || axis == AXIS_BOTH) {
              if (v.dx > velocity) {
                onSwipeRight();
              } else if (v.dx < -velocity) {
                onSwipeLeft();
              }
            }
          } catch (e) {
            debugPrintStack(
                label:
                    "******************FUNCTIONS NOT DEFINED*********************",
                stackTrace: StackTrace.fromString(
                    "Please define the functions for given AXIS constant - CustomGestureDetector"));
          }
        },
        child: child);
  }
}
