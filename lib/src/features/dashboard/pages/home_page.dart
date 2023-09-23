import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/features/dashboard/componets/home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final appScreenSize = MediaQuery.sizeOf(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: appScreenSize.height * .23,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor
            ),
            child: const HomePageAppBar(),
          ),
        )
      ],
    );
  }
}
