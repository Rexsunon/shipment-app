import 'package:intl/intl.dart';

String formatDate(String date) {
  final dateFormatter = DateFormat("MMM d, yyyy");
  return dateFormatter.format(DateTime.parse(date));
}

extension FormatAsMoney on String {
  String formatAsMoney({String currencySymbol = '\$'}) {
    try {
      final number = double.parse(this);
      final formatter = NumberFormat.currency(symbol: currencySymbol);

      return formatter.format(number);
    } catch (e) {
      return this;
    }
  }
}
