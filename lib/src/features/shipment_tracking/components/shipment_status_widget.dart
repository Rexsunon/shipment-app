import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/util/util.dart';
import 'package:shipment_app/src/models/enum/shipment_status.dart';
import 'package:solar_icons/solar_icons.dart';

class ShipmentStatusWidget extends StatelessWidget {
  const ShipmentStatusWidget({super.key, required this.shipmentStatus});

  final ShipmentStatus shipmentStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFf6f6f6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            SolarIconsBold.repeat,
            size: 16,
            color: getStatusColor(shipmentStatus),
          ),
          const SizedBox(width: 10),
          Text(
            getStatusLabel(shipmentStatus),
            style: TextStyle(
              color: getStatusColor(shipmentStatus),
            ),
          ),
        ],
      ),
    );
  }
}
