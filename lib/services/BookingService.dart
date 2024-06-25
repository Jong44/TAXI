import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/models/BookingModel.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/models/ProfileModel.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ref = FirebaseFirestore.instance.collection('transaksis');

  Future<String> tambahRiwayatTransaksi(BookingModel book) async {
    try {
      await ref.add(book.toJson());
      return 'Success';
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Map<String, dynamic>>> getRiwayatTransaksi() async {
    final refDokter = FirebaseFirestore.instance.collection('dokters');
    final refUser = FirebaseFirestore.instance.collection('users');
    final snapshot = await ref.get();
    final data = snapshot.docs;
    List<Map<String, dynamic>> list = [];
    for (var item in data) {
      final data = item.data() as Map<String, dynamic>;
      final user = await refUser
          .doc(data['userUid'])
          .collection('profile')
          .get()
          .then((value) => value.docs.first);
      final dokter = await refDokter.doc(data["dokterUid"]).get();
      final dokterMap = dokter.data() as Map<String, dynamic>;
      dokterMap['uid'] = dokter.id;

      list.add({
        'date': item.data()['date'],
        'waktu': item.data()['waktu'],
        'layanan': item.data()['layanan'],
        'dokter': DokterModel.fromJson(dokterMap),
        'user': ProfileModel.fromJson(user.data()),
        'durasi': item.data()['durasi'],
        'mediaKonseling': item.data()['mediaKonseling'],
        'metodePembayaran': item.data()['metodePembayaran'],
      });
    }

    return list;
  }
}
