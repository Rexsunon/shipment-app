import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/features/dashboard/pages/calculator_page.dart';
import 'package:shipment_app/src/features/dashboard/pages/home_page.dart';
import 'package:shipment_app/src/features/dashboard/pages/profile_page.dart';
import 'package:shipment_app/src/features/dashboard/pages/shipment_page.dart';
import 'package:solar_icons/solar_icons.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  static const routeName = '/';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late PageController pageController;
  int currentPage = 0;

  final pages = const [
    HomePage(),
    CalculatorPage(),
    ShipmentPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
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
        currentIndex: currentPage,
        onTap: (value) {
          setState(() => currentPage = value);
          pageController.jumpToPage(value);
        },
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
