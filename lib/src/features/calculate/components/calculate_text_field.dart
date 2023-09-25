import 'package:flutter/material.dart';

class CalculateTextField extends StatelessWidget {
  const CalculateTextField({super.key, required this.hint, required this.icon});

  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: const Color(0xFFf8f8f8),
        filled: true,
        isDense: true,
        // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF999999)),
              const SizedBox(width: 5),
              Container(
                height: 20,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
