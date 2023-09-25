import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/models/data/category_data.dart';
import 'package:shipment_app/src/models/models.dart';

class SelectableCategories extends StatefulWidget {
  const SelectableCategories({super.key});

  @override
  State<SelectableCategories> createState() => _SelectableCategoriesState();
}

class _SelectableCategoriesState extends State<SelectableCategories> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<Offset> animation;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation = Tween(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, // Adjust the curve as needed
      ),
    );

    fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, // Adjust the curve as needed
      ),
    );

    _animationController.forward();
  }
  List<bool> isSelectedList = List.generate(categories.length, (index) => false);

  void toggleSelection(int index) {
    setState(() {
      isSelectedList[index] = !isSelectedList[index];
    });
  }

  @override
  void dispose() {
    _animationController.reverse();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.categories,
          style: TextStyleConstants.bodyLarge(context).copyWith(
            color: kTextHeadingColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          localization.whatAreYouSending,
          style: TextStyleConstants.caption(context),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: categories.asMap().entries.map((entry) {
            final int index = entry.key;
            final Category category = entry.value;
            final bool isSelected = isSelectedList[index];

            return SlideTransition(
              position: animation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: GestureDetector(
                  onTap: () => toggleSelection(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFa0a0a0)),
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? const Color(0xFF212737) : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        isSelected ? const Icon(Icons.check, color: Colors.white, size: 18,) : const SizedBox.shrink(),
                        isSelected ? const SizedBox(width: 4) : const SizedBox.shrink(),
                        Text(category.name, style: TextStyleConstants.bodyMedium(context).copyWith(color: isSelected ? Colors.white : null),),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
