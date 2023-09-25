import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/core/util/util.dart';
import 'package:shipment_app/src/features/shipment_tracking/components/shipment_status_widget.dart';
import 'package:shipment_app/src/models/models.dart';

class ShipmentListItem extends StatelessWidget {
  const ShipmentListItem({super.key, required this.shipment});

  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShipmentStatusWidget(shipmentStatus: shipment.status),
                  const SizedBox(height: 10),
                  Text(
                    'Arriving today!',
                    style: TextStyleConstants.bodyLarge(context).copyWith(fontWeight: FontWeight.w700,),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Your delivery, ${shipment.receipt} from ${shipment.from}, is Arriving today!',
                      style: TextStyleConstants.caption(context),
                      softWrap: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: shipment.amount.toString().formatAsMoney(),
                          style: TextStyleConstants.bodyLarge(context).copyWith(
                            color: kAccentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " • ${formatDate(shipment.date)}",
                          style: TextStyleConstants.bodyLarge(context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Image.asset(
                kShipmentBoxPng,
                width: 60,
                height: 60,
                // color: const Color(0xFFb6bbc1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
