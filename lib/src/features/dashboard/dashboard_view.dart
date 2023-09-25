import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/features/calculate/calculate_view.dart';
import 'package:shipment_app/src/features/dashboard/pages/calculator_page.dart';
import 'package:shipment_app/src/features/dashboard/pages/home_page.dart';
import 'package:shipment_app/src/features/dashboard/pages/profile_page.dart';
import 'package:shipment_app/src/features/dashboard/pages/shipment_page.dart';
import 'package:shipment_app/src/features/shipment_tracking/shipment_view.dart';
import 'package:solar_icons/solar_icons.dart';

import 'components/animated_bottom_navigation_bar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  static const routeName = '/';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late PageController pageController;
  int currentPage = 0;

  final pages = const [
    HomePage(),
    CalculatorPage(),
    ShipmentPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    if (index == 1) {
      // Navigate to CalculateView when the 2nd item is tapped
      Navigator.of(context).restorablePushNamed(CalculateView.routeName);
    } else if (index == 2) {
      // Navigate to ShipmentView when the 3rd item is tapped
      Navigator.of(context).restorablePushNamed(ShipmentView.routeName);
    } else {
      setState(() => currentPage = index);
      pageController.jumpToPage(index);
    }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => pages[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // animationController: animationController,
        currentIndex: currentPage,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(SolarIconsOutline.home),
            label: localization.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(SolarIconsOutline.calculator),
            label: localization.calculator,
          ),
          BottomNavigationBarItem(
            icon: const Icon(SolarIconsOutline.repeat),
            label: localization.shipment,
          ),
          BottomNavigationBarItem(
            icon: const Icon(SolarIconsOutline.user),
            label: localization.profile,
          ),
        ],
      ),
    );
  }
}
