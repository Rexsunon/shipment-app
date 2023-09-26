import 'package:flutter/material.dart';

class SlideUpAnimationWidget extends StatefulWidget {
  const SlideUpAnimationWidget({super.key, required this.child});

  final Widget child;

  @override
  State<SlideUpAnimationWidget> createState() => _SlideUpAnimationWidgetState();
}

class _SlideUpAnimationWidgetState extends State<SlideUpAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500),);

    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value * 100),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
