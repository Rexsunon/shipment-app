import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/features/dashboard/components/tracking_card_item.dart';

class ShipmentTrackingCard extends StatelessWidget {
  const ShipmentTrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.tracking,
          style: TextStyleConstants.headline2(context)
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 20),

        // todo: modularize the content of the card
        AppCard(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localization.shipmentNumber,
                        style: TextStyleConstants.caption(context),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "NEJ20089934122231",
                        style: TextStyleConstants.headline2(context)
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Image.asset(kForkLiftPng, width: 40, height: 40),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              const TrackingCardItem(sending: true),
              const SizedBox(height: 20),
              const TrackingCardItem(sending: false),
              const SizedBox(height: 5),
              const Divider(),
              Text(
                localization.addStop,
                style: TextStyleConstants.bodyMedium(context)
                    .copyWith(color: kButtonColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
