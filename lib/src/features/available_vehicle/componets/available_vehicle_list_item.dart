import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/models/models.dart';

class AvailableVehicleListItem extends StatelessWidget {
  const AvailableVehicleListItem({super.key, required this.availableVehicle});

  final AvailableVehicle availableVehicle;

  @override
  Widget build(BuildContext context) {
    final appScreenSize = MediaQuery.sizeOf(context);

    return AppCard(
      width: appScreenSize.width * .36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(availableVehicle.name, style: TextStyleConstants.bodyLarge(context),),
          Text(availableVehicle.space, style: TextStyleConstants.caption(context),),
        ],
      ),
    );
  }
}
