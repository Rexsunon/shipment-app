import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/common/slide_up_animation_widget.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:solar_icons/solar_icons.dart';

import 'calculate_text_field.dart';

class DestinationSection extends StatefulWidget {
  const DestinationSection({super.key});

  @override
  State<DestinationSection> createState() => _DestinationSectionState();
}

class _DestinationSectionState extends State<DestinationSection> {
  List<Widget> generateColumnChildrenWithSizers(List<CalculateTextField> textFields) {
    List<Widget> children = [];
    for (int i = 0; i < textFields.length; i++) {
      children.add(textFields[i]);
      if (i < textFields.length - 1) {
        children.add(const SizedBox(height: 15));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final destinationFields = [
      CalculateTextField(
        hint: localization.senderLocation,
        icon: SolarIconsOutline.sendSquare,
      ),
      CalculateTextField(
        hint: localization.senderLocation,
        icon: SolarIconsOutline.receiveSquare,
      ),
      CalculateTextField(
        hint: localization.senderLocation,
        icon: SolarIconsOutline.hourglass,
      ),
    ];

    return SlideUpAnimationWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.destination,
            style: TextStyleConstants.bodyLarge(context).copyWith(
              color: kTextHeadingColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          AppCard(
            child: Column(
              children:
              generateColumnChildrenWithSizers(destinationFields),
            ),
          ),
        ],
      ),
    );
  }
}
