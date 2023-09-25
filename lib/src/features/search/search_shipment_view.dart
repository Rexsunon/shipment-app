import 'package:flutter/material.dart';
import 'package:shipment_app/src/core/common/app_card.dart';
import 'package:shipment_app/src/core/common/search_text_field.dart';
import 'package:shipment_app/src/features/search/components/suggestion_list_item.dart';
import 'package:shipment_app/src/models/models.dart';
import 'package:solar_icons/solar_icons.dart';

class SearchShipmentView extends StatefulWidget {
  const SearchShipmentView({super.key});

  static const routeName = '/search_view';

  @override
  State<SearchShipmentView> createState() => _SearchShipmentViewState();
}

class _SearchShipmentViewState extends State<SearchShipmentView>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _suggestionAnimation;

  final TextEditingController _searchController = TextEditingController();
  final List<Shipment> _shipments = generateShipmentDemoData();
  List<Shipment> _suggestions = [];

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _suggestions = _shipments.where((shipment) {
        final productName = shipment.productName.toLowerCase();
        final receipt = shipment.receipt.toLowerCase();
        return productName.contains(query) || receipt.contains(query);
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _suggestionAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Initially, show default suggestions
    _suggestions = _shipments;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          MediaQuery.sizeOf(context).height * .15,
        ),
        child: Hero(
          tag: "appbar",
          child: Material(
            child: Container(
              height: MediaQuery.sizeOf(context).height * .15,
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        SolarIconsOutline.altArrowLeft,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SearchTextField(
                          controller: _searchController,
                          autoFocus: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: () {
          if (_suggestions.isEmpty) {
            return const SizedBox.shrink();
          }

          return AppCard(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.separated(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  var suggestion = _suggestions[index];
                  return SuggestionListItem(shipment: suggestion);
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
              ),
            ),
          );
        }(),
      ),
    );
  }
}
