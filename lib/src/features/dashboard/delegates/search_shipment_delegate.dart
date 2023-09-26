import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shipment_app/src/models/models.dart';
import 'package:solar_icons/solar_icons.dart';

class SearchShipmentDelegate extends SearchDelegate<String> {
  final String searchHint;

  SearchShipmentDelegate({required this.searchHint}): super(
    searchFieldLabel: searchHint,
    searchFieldDecorationTheme: InputDecorationTheme(
      isDense: true,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      /*prefixIcon: const Icon(SolarIconsOutline.magnifier, size: 18, color: Colors.black,),
      suffixIcon: Container(
        margin: const EdgeInsets.only(right: 10),
        child: const CircleAvatar(
          backgroundColor: Color(0xFFff7000),
          child: Icon(SolarIconsOutline.objectScan, color: Colors.white),
        ),
      ),*/
    )
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Platform.isAndroid ? Icons.arrow_back : SolarIconsBold.arrowLeft),
      onPressed: () {
        // Close the search delegate without a result
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Shipment> filteredData = generateShipmentDemoData().where((shipment) {
      // Filter shipments based on the query.
      return shipment.receipt.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final shipment = filteredData[index];
        return ListTile(
          title: Text(shipment.productName),
          onTap: () {
            close(context, shipment.productName);
          },
        );
      },
    );
  }

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    // TODO: implement buildBottom
    return super.buildBottom(context);
  }

}
