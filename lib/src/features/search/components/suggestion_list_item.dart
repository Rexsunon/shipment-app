import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/slide_up_animation_widget.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/models/models.dart';

class SuggestionListItem extends StatelessWidget {
  const SuggestionListItem({super.key, required this.shipment});

  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return SlideUpAnimationWidget(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
            Theme.of(context).appBarTheme.backgroundColor,
            child: Image.asset(
              kSearchPackageBoxPng,
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shipment.productName,
                style: TextStyleConstants.bodyLarge(context),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .7,
                child: Text(
                  '${shipment.receipt} • ${shipment.from.split(" ")[0]} → ${shipment.to.split(" ")[0]}',
                  style: TextStyleConstants.caption(context).copyWith(fontSize: 14, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
