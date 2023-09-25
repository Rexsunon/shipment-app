import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';

class PackagingSection extends StatelessWidget {
  const PackagingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localization.packaging, style: TextStyleConstants.bodyLarge(context).copyWith(color: kTextHeadingColor, fontWeight: FontWeight.w700,),),
        Text(localization.whatAreYouSending, style: TextStyleConstants.caption(context),),
        const SizedBox(height: 10),
        AppCard(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(kShipmentBoxPng, scale: 25.0,),
                  const SizedBox(width: 10),
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
                  ),
                  const SizedBox(width: 10),
                  Text(localization.box, style: TextStyleConstants.bodyLarge(context).copyWith(color: kTextHeadingColor, fontWeight: FontWeight.w700,),)
                ],
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ],
    );
  }
}
