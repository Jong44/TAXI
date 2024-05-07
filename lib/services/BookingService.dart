import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/models/BookingModel.dart';

class BookingService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> tambahRiwayatTransaksi(BookingModel book) async {
    await init();
    List<String> listBooking = _prefs.getStringList('booking') ?? [];
    List<BookingModel> listMapBooking = listBooking.map((e) {
      return BookingModel.fromJson(jsonDecode(e));
    }).toList();
    listMapBooking.add(book);
    List<String> listStringBooking = listMapBooking.map((e) {
      return jsonEncode(e.toJson());
    }).toList();
    _prefs.setStringList('listBooking', listStringBooking);
    print("Berhasil menambahkan riwayat transaksi");
  }

  Future<List<BookingModel>> getRiwayatTransaksi() async {
    await init();
    List<String> listBooking = _prefs.getStringList('listBooking') ?? [];
    List<BookingModel> listMapBooking = listBooking.map((e) {
      return BookingModel.fromJson(jsonDecode(e));
    }).toList();
    return listMapBooking;
  }
}
