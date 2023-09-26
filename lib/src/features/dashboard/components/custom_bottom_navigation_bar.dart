import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/slide_up_animation_widget.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onChange,
  })  : assert(items.length >= 2),
        assert(0 <= currentIndex && currentIndex < items.length),
        super(key: key);

  final int currentIndex;
  final List<CustomBottomNavigationBarItem> items;
  final ValueChanged<int>? onChange;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        decoration: BoxDecoration(color: theme.cardColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map(
            (item) {
              var index = items.indexOf(item);
              return InkWell(
                splashColor: null,
                highlightColor: null,
                onTap: () => onChange!(index),
                child: CustomBottomNavigationBarItemWidget(
                  isSelected: index == currentIndex,
                  item: item,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItemWidget extends StatelessWidget {
  const CustomBottomNavigationBarItemWidget({
    Key? key,
    required this.isSelected,
    required this.item,
  }) : super(key: key);

  final bool isSelected;
  final CustomBottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var screenSize = MediaQuery.sizeOf(context);

    return SlideUpAnimationWidget(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              width: screenSize.width * .128,
              height: isSelected ? 3 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: EdgeInsets.only(
                bottom: screenSize.width * .014,
              ),
              decoration: BoxDecoration(
                color: isSelected ? kAccentColor : const Color(0xFFa0a0a0),
              ),
            ),
            SizedBox(
              height: 25,
              width: 25,
              child: Icon(item.icon, color: isSelected ? kAccentColor : const Color(0xFFa0a0a0),),
            ),
            const SizedBox(height: 7),
            Text(
              item.label,
              style: TextStyleConstants.bodySmall(context).copyWith(color: isSelected ? kAccentColor : const Color(0xFFa0a0a0),),
            )
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  CustomBottomNavigationBarItem({
    required this.icon,
    required this.label,
    this.color,
  });

  late final IconData icon;
  late final String label;
  late final Color? color;
}
