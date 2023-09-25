import 'package:flutter/material.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;
  final AnimationController animationController;
  final BottomNavigationBarType type;

  const AnimatedBottomNavigationBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.animationController,
    required this.type
  }) : super(key: key);

  @override
  State<AnimatedBottomNavigationBar> createState() =>
      _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState extends State<AnimatedBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeIn,
      bottom: widget.animationController.value * 50,
      left: 0,
      right: 0,
      child: BottomNavigationBar(
        items: widget.items,
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        type: widget.type,
      ),
    );
  }
}
