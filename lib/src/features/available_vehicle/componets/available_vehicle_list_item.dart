import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/models/models.dart';

class AvailableVehicleListItem extends StatelessWidget {
  const AvailableVehicleListItem({
    super.key,
    required this.availableVehicle,
  });

  final AvailableVehicle availableVehicle;

  @override
  Widget build(BuildContext context) {
    final appScreenSize = MediaQuery.sizeOf(context);

    return AppCard(
      width: appScreenSize.width * .36,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  availableVehicle.name,
                  style: TextStyleConstants.bodyLarge(context),
                ),
                Text(
                  availableVehicle.space,
                  style: TextStyleConstants.caption(context),
                ),
              ],
            ),
          ),
          Positioned(
            left: 50,
            bottom: 0,
            child: Image.asset(
              availableVehicle.vectorPath,
              width: .45 * appScreenSize.width,
              height: .2 * appScreenSize.height,
            ),
          )
        ],
      ),
    );
  }
}
