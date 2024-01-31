import 'package:cloud_firestore/cloud_firestore.dart';
import 'event_model.dart';

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Event>> getAllEvents() {
    return _firestore.collection('events').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Event(
          name: data['name'] ?? '',
          date: data['date'] ?? '',
          location: data['location'] ?? '',
        );
      }).toList();
    });
  }
}
