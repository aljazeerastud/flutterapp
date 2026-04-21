import 'package:flutter/material.dart';


class ScaleAnimationWidget extends StatefulWidget {
  const ScaleAnimationWidget({Key? key,required this.childWidget}) : super(key: key);
  final Widget childWidget;
  @override
  State<ScaleAnimationWidget> createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>     with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;



  // _ScaleAnimationState({required this.childWidget});
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    // _scaleAnimation = Tween(begin: 0.5, end:1.0).animate(_controller);
    _controller.stop(canceled: true);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _scaleAnimation,
        child: widget.childWidget
      // Container(
      //   width: 100,
      //   height: 100,
      //   color: Colors.purple,
      // ),
    );
  }
}
