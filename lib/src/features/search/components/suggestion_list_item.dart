import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/models/models.dart';

class SuggestionListItem extends StatefulWidget {
  const SuggestionListItem({super.key, required this.shipment});

  final Shipment shipment;

  @override
  State<SuggestionListItem> createState() => _SuggestionListItemState();
}

class _SuggestionListItemState extends State<SuggestionListItem> with SingleTickerProviderStateMixin {
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
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
            Theme.of(context).appBarTheme.backgroundColor,
            child: Image.asset(
              kSearchPackageBoxPng,
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.shipment.productName,
                style: TextStyleConstants.bodyLarge(context),
              ),
              Text(
                '${widget.shipment.receipt} · ${widget.shipment.from.split(" ")[0]} → ${widget.shipment.to.split(" ")[0]}',
                style: TextStyleConstants.caption(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
