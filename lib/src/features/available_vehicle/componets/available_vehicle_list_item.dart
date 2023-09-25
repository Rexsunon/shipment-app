import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';
import 'package:shipment_app/src/models/models.dart';

class AvailableVehicleListItem extends StatefulWidget {
  const AvailableVehicleListItem({
    super.key,
    required this.availableVehicle,
  });

  final AvailableVehicle availableVehicle;

  @override
  State<AvailableVehicleListItem> createState() => _AvailableVehicleListItemState();
}

class _AvailableVehicleListItemState extends State<AvailableVehicleListItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Adjust the duration as needed
    );


    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animations when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appScreenSize = MediaQuery.sizeOf(context);

    return AppCard(
      width: appScreenSize.width * .36,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.availableVehicle.name,
                  style: TextStyleConstants.bodyLarge(context),
                ),
                Text(
                  widget.availableVehicle.space,
                  style: TextStyleConstants.caption(context),
                ),
              ],
            ),
          ),
          Positioned(
            left: 50,
            bottom: 0,
            child: SlideTransition(
              position: _animation,
              child: Image.asset(
                widget.availableVehicle.vectorPath,
                width: .45 * appScreenSize.width,
                height: .2 * appScreenSize.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
