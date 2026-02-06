import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_scoreboard/model/upcoming_model.dart';

class UpcomingService {
  final FirebaseFirestore today = FirebaseFirestore.instance;

  Future<List<UpcomingModel>> getUpcomingMatch() async {
    final snapshot = await today.collection('upcomingMatches').get();

    return snapshot.docs.map((doc) {
      return UpcomingModel.fromMap(doc.data(),doc.id);
    }).toList();
  }

  Future<void> addUpcomingMatch(UpcomingModel model) async {
    await today.collection('upcomingMatches').add(model.toMap());
  }

  Future<void> deleteUpcomgMatch(String id) async {
    await today.collection('upcomingMatches').doc(id).delete();
  }
}