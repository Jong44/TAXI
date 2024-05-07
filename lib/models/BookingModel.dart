import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/models/ProfileModel.dart';

class BookingModel {
  final String date;
  final String waktu;
  final String layanan;
  final DokterModel dokter;
  final ProfileModel user;
  final String durasi;
  final String mediaKonseling;
  final String metodePembayaran;

  BookingModel({
    required this.date,
    required this.waktu,
    required this.layanan,
    required this.dokter,
    required this.user,
    required this.durasi,
    required this.mediaKonseling,
    required this.metodePembayaran,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      date: json['date'],
      waktu: json['waktu'],
      layanan: json['layanan'],
      dokter: DokterModel.fromJson(json['dokter']),
      user: ProfileModel.fromJson(json['user']),
      durasi: json['durasi'],
      mediaKonseling: json['mediaKonseling'],
      metodePembayaran: json['metodePembayaran'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'waktu': waktu,
      'layanan': layanan,
      'dokter': dokter.toJson(),
      'user': user.toJson(),
      'durasi': durasi,
      'mediaKonseling': mediaKonseling,
      'metodePembayaran': metodePembayaran,
    };
  }
}
