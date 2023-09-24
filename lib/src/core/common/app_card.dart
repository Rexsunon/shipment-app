import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, this.width, this.height, required this.child, this.padding,});

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!.withOpacity(0.8),
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 2.0),
          ),
        ],
      ),
      child: child,
    );
  }
}
