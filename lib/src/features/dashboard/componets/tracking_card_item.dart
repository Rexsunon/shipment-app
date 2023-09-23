import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipment_app/src/core/constants/assets_constants.dart';
import 'package:shipment_app/src/core/constants/text_style_constants.dart';

class TrackingCardItem extends StatelessWidget {
  const TrackingCardItem({super.key, required this.sending});

  final bool sending;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundColor: const Color(0xffffe1cc),
                child: Image.asset(
                  sending ? kPackageBoxPng : kOpenBoxPng,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sending ? localization.sender : localization.receiver,
                  style: TextStyleConstants.caption(context),
                ),
                Text(
                  "Lagos, 5243",
                  style: TextStyleConstants.bodyMedium(context),
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sending ? localization.time : localization.status,
              style: TextStyleConstants.caption(context),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: sending,
                  child: const Icon(Icons.circle, color: Colors.green, size: 10),
                ),
                sending ? const SizedBox(width: 10) : const  SizedBox.shrink(),
                Text(
                  sending ? "2 day -3 days" : "Waiting to collect",
                  style: TextStyleConstants.bodyMedium(context),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
