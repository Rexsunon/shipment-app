import 'package:flutter/material.dart';

class SlideInFromRightAnimationWidget extends StatefulWidget {
  const SlideInFromRightAnimationWidget({super.key, required this.child});

  final Widget child;

  @override
  State<SlideInFromRightAnimationWidget> createState() => _SlideInFromRightAnimationWidgetState();
}

class _SlideInFromRightAnimationWidgetState extends State<SlideInFromRightAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500),);

    _animation = Tween(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut, // Adjust the curve as needed
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
