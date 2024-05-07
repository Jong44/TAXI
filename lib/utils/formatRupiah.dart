import 'package:intl/intl.dart';

String formatRupiah(int value) {
  final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
  formatter.maximumFractionDigits = 0; // Set maximum fraction digits to 0
  return formatter.format(value);
}
