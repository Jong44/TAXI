import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/models/DokterModel.dart';

class DokterService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ref = FirebaseFirestore.instance.collection('dokters');
  Future<List<DokterModel>> getDokter() async {
    QuerySnapshot snapshot = await _firestore.collection('dokters').get();
    List<DokterModel> listDokter = [];
    for (var item in snapshot.docs) {
      final data = item.data() as Map<String, dynamic>;
      data['uid'] = item.id;
      DokterModel dokter = DokterModel.fromJson(data);
      listDokter.add(dokter);
    }
    return listDokter;
  }
}
