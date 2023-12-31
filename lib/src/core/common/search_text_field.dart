import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, this.controller, this.autoFocus = false, this.enabled = true, this.onTap,});

  final TextEditingController? controller;
  final bool autoFocus;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return TextField(
      controller: widget.controller,
      autofocus: widget.autoFocus,
      enabled: widget.enabled,
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        prefixIcon: const Icon(SolarIconsOutline.magnifier, size: 18, color: Colors.black,),
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 10),
          child: const CircleAvatar(
            backgroundColor: Color(0xFFff7000),
            child: Icon(SolarIconsOutline.objectScan, color: Colors.white),
          ),
        ),
        hintText: localization.enterTheReceiptNumber,
      ),
      onTap: widget.onTap,
    );
  }
}
