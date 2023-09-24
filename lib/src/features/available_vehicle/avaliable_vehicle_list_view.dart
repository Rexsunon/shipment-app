import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/features/available_vehicle/componets/available_vehicle_list_item.dart';
import 'package:shipment_app/src/models/models.dart';

class AvailableVehicleListView extends StatelessWidget {
  const AvailableVehicleListView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final availableVehiclesLIst = [
      AvailableVehicle(name: localization.oceanFreight, space: localization.international, vectorPath: kOceanFreightPng,),
      AvailableVehicle(name: localization.cargoFreight, space: localization.reliable, vectorPath: kCargoFreightPng,),
      AvailableVehicle(name: localization.airFreight, space: localization.international, vectorPath: kAirFreightPng,),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            localization.availableVehicles,
            style: TextStyleConstants.headline2(context)
                .copyWith(fontSize: 18),
          ),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final availableVehicle = availableVehiclesLIst[index];

              return AvailableVehicleListItem(availableVehicle: availableVehicle);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: availableVehiclesLIst.length,
          ),
        ),
      ],
    );
  }
}
