import 'package:flutter/material.dart';
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

  // Helper method to get the status label
  String getStatusLabel(ShipmentStatus status) {
    switch (status) {
      case ShipmentStatus.loading:
        return 'loading';
      case ShipmentStatus.inProgress:
        return 'in-progress';
      case ShipmentStatus.completed:
        return 'completed';
      case ShipmentStatus.pending:
        return 'pending orders';
    }
  }

  // Helper method to get the status label
  Color getStatusColor(ShipmentStatus status) {
    switch (status) {
      case ShipmentStatus.loading:
        return const Color(0xFF4784bd);
      case ShipmentStatus.inProgress:
        return const Color(0xFF7abea0);
      case ShipmentStatus.completed:
        return const Color(0xFF53448e);
      case ShipmentStatus.pending:
        return const Color(0xFFe89552);
    }
  }
}
