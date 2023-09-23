import 'package:flutter/material.dart';
import 'package:shipment_app/src/features/available_vehicle/avaliable_vehicle_list_view.dart';
import 'package:shipment_app/src/features/dashboard/componets/home_page_app_bar.dart';
import 'package:shipment_app/src/features/shipment_tracking/shipment_tracking_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appScreenSize = MediaQuery.sizeOf(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: appScreenSize.height * .23,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            child: const HomePageAppBar(),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: ShipmentTrackingCard(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: appScreenSize.height * .3,
            child: const AvailableVehicleListView(),
          ),
        )
      ],
    );
  }
}
