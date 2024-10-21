import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TrainingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getTrainings() async {
    QuerySnapshot snapshot = await _firestore.collection('Popular_Exercises').get();
    return snapshot.docs
        .map(
          (doc) => {
        'name': doc['name'],
        'imagePath': doc['imagePath'],
        'time': doc['time'],
        'description': doc['description'],
      },
    )
        .toList();
  }
}

class TrainingImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> getTrainingImageUrl(String imagePath) async {
    return await _storage.ref('Training/$imagePath').getDownloadURL();
  }
}
