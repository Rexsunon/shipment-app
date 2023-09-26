import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/features/shipment_tracking/components/shipment_list_item.dart';
import 'package:shipment_app/src/models/models.dart';

class ShipmentListView extends StatelessWidget {
  const ShipmentListView({super.key, required this.shipments});

  final List<Shipment> shipments;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: Text(
              localization.shipment,
              style: TextStyleConstants.headline2(context),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return ShipmentListItem(shipment: shipments[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: shipments.length,
          ),
        )
      ],
    );
  }
}
