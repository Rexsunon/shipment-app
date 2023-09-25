import 'package:flutter/material.dart';

class FadeInAnimationWidget extends StatefulWidget {
  const FadeInAnimationWidget({super.key, required this.child});

  final Widget child;

  @override
  State<FadeInAnimationWidget> createState() => _FadeInAnimationWidgetState();
}

class _FadeInAnimationWidgetState extends State<FadeInAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800),);

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
    return Opacity(
      opacity: _animation.value,
      child: widget.child,
    );
  }
}
