import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';

class AppButton extends StatefulWidget {
  const AppButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  void tapDown(TapDownDetails details) => animationController.forward();

  void tapUp(TapUpDetails details) => animationController.reverse();

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.1,
      vsync: this,
    )..addListener(() {
      setState(() { });
    });
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = 1.0 - animationController.value;

    return GestureDetector(
      onTapDown: tapDown,
      onTapUp: tapUp,
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: kButtonColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
