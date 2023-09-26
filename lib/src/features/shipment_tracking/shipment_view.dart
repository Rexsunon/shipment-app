import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/features/shipment_tracking/shipment_list_view.dart';
import 'package:shipment_app/src/models/models.dart';
import 'package:solar_icons/solar_icons.dart';

import 'components/tab_item.dart';

class ShipmentView extends StatefulWidget {
  const ShipmentView({super.key});

  static const routeName = '/shipment_view';

  @override
  State<ShipmentView> createState() => _ShipmentViewState();
}

class _ShipmentViewState extends State<ShipmentView> with TickerProviderStateMixin {
  late TabController tabController;
  late AnimationController animationController;
  late Animation<double> appBarAnimation;
  List<Shipment> defaultList  = [];
  List<Shipment> filteredShipments = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    appBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController, // Use the first AnimationController
        curve: Curves.easeInOut,
      ),
    );

    defaultList = generateShipmentDemoData();
    animationController.forward();
  }

  @override
  void dispose() {
    tabController.dispose();
    animationController.dispose();
    super.dispose();
  }

  // Filter shipments based on status
  List<Shipment> filterShipmentsByStatus(ShipmentStatus status) {
    return defaultList.where((shipment) => shipment.status == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final tabs = [
      Tab(child: TabItem(label: localization.all, number: defaultList.length)),

      // dynamically load the rest of the tabItems by status
      for (int i = 0; i < 4; i++)
        Tab(
          child: TabItem(
            label: getTabLabel(ShipmentStatus.values[i]),
            number: getTabCount(ShipmentStatus.values[i]),
          ),
        ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + kToolbarHeight),
        child: Hero(
          tag: "appbar",
          child: Material(
            child: Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeTransition(
                          opacity: appBarAnimation,
                          child: IconButton(
                            icon: const Icon(SolarIconsOutline.altArrowLeft, color: Colors.white,),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        FadeTransition(
                          opacity: appBarAnimation,
                          child: Text(localization.shipmentHistory, style: TextStyleConstants.bodyLarge(context).copyWith(color: Colors.white),),
                        ),
                        SizedBox(width: MediaQuery.sizeOf(context).width * .1),
                      ],
                    ),
                    const Spacer(),
                    TabBar(
                      controller: tabController,
                      isScrollable: true,
                      enableFeedback: true,
                      indicatorColor: kButtonColor,
                      // padding: const EdgeInsets.symmetric(horizontal: 20),
                      onTap: (value) {
                        // do nothing if the tapped tabItem is the first
                        if (value < 1) {
                          // filteredShipments = defaultList;
                          return;
                        }

                        // When a tab is tapped, update the filtered shipments
                        setState(() {
                          filteredShipments = filterShipmentsByStatus(ShipmentStatus.values[value - 1]);
                        });
                      },
                      tabs: tabs.map((tab) {
                        // Add slide Transaction to the tabItems when the screen launch
                        return SlideTransition(
                          position: Tween(
                            begin: const Offset(1.0, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: Curves.easeOut,
                            ),
                          ),
                          child: tab,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
            children: [
              // load all shipment tab view
              ShipmentListView(shipments: defaultList),

              // load the tabView by status
              for (int index = 0; index < 4; index++)
                ShipmentListView(shipments: filteredShipments),
            ],
          ),

          // White overlay foreground at the bottom of the view
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -4.00),
                  end: const Alignment(0, 1),
                  colors: [Colors.white.withOpacity(0), Colors.white],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Helper method to get the label for each tab based on status
  String getTabLabel(ShipmentStatus status) {
    switch (status) {
      case ShipmentStatus.loading:
        return 'Loading';
      case ShipmentStatus.inProgress:
        return 'In Progress';
      case ShipmentStatus.completed:
        return 'Completed';
      case ShipmentStatus.pending:
        return 'Pending Orders';
    }
  }

  // Helper method to get the count for each tab based on status
  int getTabCount(ShipmentStatus status) {
    return filteredShipments.where((shipment) => shipment.status == status).length;
  }
}
