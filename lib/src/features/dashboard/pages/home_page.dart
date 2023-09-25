import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/features/available_vehicle/avaliable_vehicle_list_view.dart';
import 'package:shipment_app/src/features/dashboard/components/home_page_app_bar.dart';
import 'package:shipment_app/src/features/shipment_tracking/components/shipment_tracking_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation1 = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _animation2 = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _animation3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final appScreenSize = MediaQuery.sizeOf(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0.0, _animation1.value * 100),
                child: child,
              );
            },
            child: Hero(
              tag: "appbar",
              child: Material(
                child: Container(
                  height: appScreenSize.height * .23,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: const HomePageAppBar(),
                ),
              ),
            ),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _animation2.value * 100),
                  child: child,
                );
              },
              child: const ShipmentTrackingCard(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _animation2.value * 100),
                  child: Opacity(
                    opacity: _animation3.value,
                    child: child,
                  ),
                );
              },
              child: const AvailableVehicleListView(),
            ),
          ),
        ),
      ],
    );
  }
}
