import 'dart:math';

import 'package:faker/faker.dart';
import 'package:shipment_app/src/models/enum/shipment_status.dart';
import 'package:shipment_app/src/models/shipment.dart';

List<Shipment> generateShipmentDemoData() {
  final List<Shipment> demoData = [];

  final faker = Faker();

  for (int i = 0; i < 20; i++) {
    final productName = faker.vehicle.make();
    final receipt = 'Receipt-${i + 1}';
    final from = faker.address.city();
    final to = faker.address.city();
    final status = ShipmentStatus.values[Random().nextInt(ShipmentStatus.values.length)];
    final amount = (Random().nextDouble() * 1000).toDouble();
    final date = faker.date.dateTime(minYear: 2020, maxYear: 2023).toLocal().toString();

    final shipment = Shipment(
      productName: productName,
      receipt: receipt,
      from: from,
      to: to,
      status: status,
      amount: amount,
      date: date,
    );

    demoData.add(shipment);
  }

  return demoData;
}
