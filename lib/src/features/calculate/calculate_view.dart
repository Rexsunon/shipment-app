import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/common/app_button.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/features/calculate/components/packaging_section.dart';
import 'package:shipment_app/src/models/data/category_data.dart';
import 'package:solar_icons/solar_icons.dart';

import 'components/calculate_text_field.dart';
import 'components/selectable_categories.dart';

class CalculateView extends StatefulWidget {
  const CalculateView({super.key});

  static const routeName = '/calculate_view';

  @override
  State<CalculateView> createState() => _CalculateViewState();
}

class _CalculateViewState extends State<CalculateView> {
  List<Widget> generateColumnChildrenWithSizers(List<CalculateTextField> textFields) {
    List<Widget> children = [];
    for (int i = 0; i < textFields.length; i++) {
      children.add(textFields[i]);
      if (i < textFields.length - 1) {
        children.add(const SizedBox(height: 15));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height + MediaQuery.paddingOf(context).top;
    final remainingHeight = screenHeight - appBarHeight;

    final destinationFields = [
      CalculateTextField(
        hint: localization.senderLocation,
        icon: SolarIconsOutline.sendSquare,
      ),
      CalculateTextField(
        hint: localization.senderLocation,
        icon: SolarIconsOutline.receiveSquare,
      ),
      CalculateTextField(
        hint: localization.senderLocation,
        icon: SolarIconsOutline.hourglass,
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(pinned: true, title: Text(localization.calculator)),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: remainingHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localization.destination,
                      style: TextStyleConstants.bodyLarge(context).copyWith(
                        color: kTextHeadingColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AppCard(
                      child: Column(
                        children:
                        generateColumnChildrenWithSizers(destinationFields),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const PackagingSection(),
                    const SizedBox(height: 30),
                    const SelectableCategories(),
                    const Spacer(),
                    AppButton(onTap: () {}, label: localization.calculator),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
