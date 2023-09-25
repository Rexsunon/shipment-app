import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/common/app_button.dart';
import 'package:shipment_app/src/core/common/faid_in_animation_widget.dart';
import 'package:shipment_app/src/core/common/slide_up_animation_widget.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/core/util/util.dart';
import 'package:shipment_app/src/features/dashboard/dashboard_view.dart';

class TotalEstimationAmountView extends StatefulWidget {
  const TotalEstimationAmountView({super.key});

  static const routeName = '/total_estimation_amount_view';

  @override
  State<TotalEstimationAmountView> createState() =>
      _TotalEstimationAmountViewState();
}

class _TotalEstimationAmountViewState extends State<TotalEstimationAmountView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Adjust the duration as needed
      vsync: this,
    );

    _animation = IntTween(begin: 1, end: 1460).animate(_controller);
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

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInAnimationWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localization.rexMate,
                  style: TextStyleConstants.headline1(context).copyWith(
                    fontStyle: FontStyle.italic,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(kFastPng, scale: 12.0, color: kButtonColor)
              ],
            ),
          ),

          const SizedBox(height: 50),
          SlidUpAnimationWidget(child: Image.asset(kShipmentBoxPng, scale: 4)),
          const SizedBox(height: 50),
          SlidUpAnimationWidget(
            child: Text(
              localization.totalEstimationAmount,
              style: TextStyleConstants.headline1(context).copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // const SizedBox(height: 10),
          SlidUpAnimationWidget(
            child: FadeInAnimationWidget(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Text(
                    '${_animation.value.toString().formatAsMoney()} USD',
                    style: TextStyleConstants.headline1(context).copyWith(
                      color: const Color(0xFF6cc69d),
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }
              ),
            ),
          ),
          SlidUpAnimationWidget(
            child: FadeInAnimationWidget(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                child: Text(
                  localization.totalEstimationAmountText,
                  style: TextStyleConstants.caption(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SlidUpAnimationWidget(
            child: FadeInAnimationWidget(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: AppButton(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, DashboardView.routeName, (route) => true),
                  label: localization.backToHome,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
