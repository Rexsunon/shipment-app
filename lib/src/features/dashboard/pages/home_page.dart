import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/features/available_vehicle/avaliable_vehicle_list_view.dart';
import 'package:shipment_app/src/features/dashboard/componets/home_page_app_bar.dart';
import 'package:shipment_app/src/features/shipment_tracking/shipment_tracking_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final appScreenSize = MediaQuery.sizeOf(context);

    return CustomScrollView(
      slivers: [
        /*SliverAppBar(
          pinned: true,
          expandedHeight: appScreenSize.height * .17,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.near_me_rounded,
                            size: 18,
                            color: kAppBarIconColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            localization.yourLocation,
                            style: TextStyleConstants.bodyLarge(context)
                                .copyWith(
                              color: kAppBarIconColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Evidence, Rex",
                            style: TextStyleConstants.bodyLarge(context)
                                .copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(SolarIconsOutline.bell, color: Colors.black),
                ),
              ),
            ],
          ),
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: SearchTextField(),
            ),
          ),
        ),*/
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
