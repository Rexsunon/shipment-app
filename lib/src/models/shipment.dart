import 'package:shipment_app/src/models/enum/shipment_status.dart';

class Shipment {
  final String productName;
  final String receipt;
  final String from;
  final String to;
  final ShipmentStatus status;
  final double amount;
  final String date;

  Shipment({
    required this.productName,
    required this.receipt,
    required this.from,
    required this.to,
    required this.status,
    required this.amount,
    required this.date,
  });
}
