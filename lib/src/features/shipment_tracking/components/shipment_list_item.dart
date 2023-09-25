import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/core/util/util.dart';
import 'package:shipment_app/src/features/shipment_tracking/components/shipment_status_widget.dart';
import 'package:shipment_app/src/models/models.dart';

class ShipmentListItem extends StatefulWidget {
  const ShipmentListItem({super.key, required this.shipment});

  final Shipment shipment;

  @override
  State<ShipmentListItem> createState() => _ShipmentListItemState();
}

class _ShipmentListItemState extends State<ShipmentListItem> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value * 100),
          child: child,
        );
      },
      child: AppCard(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShipmentStatusWidget(shipmentStatus: widget.shipment.status),
                    const SizedBox(height: 10),
                    Text(
                      'Arriving today!',
                      style: TextStyleConstants.bodyLarge(context).copyWith(fontWeight: FontWeight.w700,),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.6,
                      child: Text(
                        'Your delivery, ${widget.shipment.receipt} from ${widget.shipment.from}, is Arriving today!',
                        style: TextStyleConstants.caption(context),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.shipment.amount.toString().formatAsMoney(),
                            style: TextStyleConstants.bodyLarge(context).copyWith(
                              color: kAccentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " • ${formatDate(widget.shipment.date)}",
                            style: TextStyleConstants.bodyLarge(context),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  kShipmentBoxPng,
                  width: 60,
                  height: 60,
                  // color: const Color(0xFFb6bbc1),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
