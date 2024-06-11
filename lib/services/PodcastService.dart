import 'package:cloud_firestore/cloud_firestore.dart';

class PodcastService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getPodcast() async {
    QuerySnapshot snapshot = await _firestore.collection('podcasts').get();
    List<Map<String, dynamic>> listPodcast = snapshot.docs.map((e) {
      return e.data() as Map<String, dynamic>;
    }).toList();
    List<Map<String, dynamic>> publishedPodcast =
        listPodcast.where((element) => element['published'] == true).toList();
    return publishedPodcast;
  }
}
