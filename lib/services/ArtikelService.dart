import 'package:cloud_firestore/cloud_firestore.dart';

class ArtikelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getArtikel() async {
    QuerySnapshot snapshot = await _firestore.collection('artikel').get();
    List<Map<String, dynamic>> listArtikel = snapshot.docs.map((e) {
      return e.data() as Map<String, dynamic>;
    }).toList();
    List<Map<String, dynamic>> publishedArtikel =
        listArtikel.where((element) => element['published'] == true).toList();
    return publishedArtikel;
  }
}
