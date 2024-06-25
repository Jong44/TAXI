import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/models/ProfileModel.dart';

class BookingModel {
  final String date;
  final String waktu;
  final String layanan;
  final String dokterUid;
  final String userUid;
  final String durasi;
  final String mediaKonseling;
  final String metodePembayaran;

  BookingModel({
    required this.date,
    required this.waktu,
    required this.layanan,
    required this.dokterUid,
    required this.userUid,
    required this.durasi,
    required this.mediaKonseling,
    required this.metodePembayaran,
  });

  factory BookingModel.fromJson(Map<String, dynamic> data) {
    return BookingModel(
      date: data['date'],
      waktu: data['waktu'],
      layanan: data['layanan'],
      dokterUid: data['dokterUid'],
      userUid: data['userUid'],
      durasi: data['durasi'],
      mediaKonseling: data['mediaKonseling'],
      metodePembayaran: data['metodePembayaran'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'waktu': waktu,
      'layanan': layanan,
      'dokterUid': dokterUid,
      'userUid': userUid,
      'durasi': durasi,
      'mediaKonseling': mediaKonseling,
      'metodePembayaran': metodePembayaran,
    };
  }
}
