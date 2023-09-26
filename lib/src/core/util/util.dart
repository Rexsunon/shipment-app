import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:shipment_app/src/models/models.dart';

String formatDate(String date) {
  final dateFormatter = DateFormat("MMM d, yyyy");
  return dateFormatter.format(DateTime.parse(date));
}

extension FormatAsMoney on String {
  String formatAsMoney({String currencySymbol = '\$'}) {
    try {
      final number = double.parse(this);
      final formatter = NumberFormat.currency(symbol: currencySymbol);

      return formatter.format(number);
    } catch (e) {
      return this;
    }
  }
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
