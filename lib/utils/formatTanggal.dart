import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

String formatTanggalHari(DateTime date) {
  String hari = "";
  String tanggal = "";
  if (DateFormat("EEEE").format(date).toString() == "Monday") {
    hari = "Senin";
  } else if (DateFormat("EEEE").format(date).toString() == "Tuesday") {
    hari = "Selasa";
  } else if (DateFormat("EEEE").format(date).toString() == "Wednesday") {
    hari = "Rabu";
  } else if (DateFormat("EEEE").format(date).toString() == "Thursday") {
    hari = "Kamis";
  } else if (DateFormat("EEEE").format(date).toString() == "Friday") {
    hari = "Jumat";
  } else if (DateFormat("EEEE").format(date).toString() == "Saturday") {
    hari = "Sabtu";
  } else if (DateFormat("EEEE").format(date).toString() == "Sunday") {
    hari = "Minggu";
  }
  final formatter = DateFormat('dd MMMM yyyy');
  tanggal = hari + ", " + formatter.format(date).toString();
  return tanggal;
}

String formatTanggal(Timestamp timestamp) {
  final formatter = DateFormat('dd MMMM yyyy');
  return formatter.format(timestamp.toDate()).toString();
}
