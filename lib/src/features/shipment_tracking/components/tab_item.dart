import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.label, required this.number});
  
  final String label;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: kButtonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text('$number'),
        ),
      ],
    );
  }
}
