import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteSuccess(false));

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loadFavoriteStatus(String itemId) async {
    try {
      emit(FavoriteLoading());
      DocumentReference docRef = _firestore.collection('Popular_Exercises').doc(itemId);

      // Load current favorite value from Firebase
      final snapshot = await docRef.get();
      bool isFavorite = snapshot['favorite'];
      emit(FavoriteSuccess(isFavorite));
    } catch (e) {
      emit(FavoriteError('Failed to load favorite status'));
    }
  }

  Future<void> toggleFavorite(String itemId) async {
    try {
      emit(FavoriteLoading());
      DocumentReference docRef = _firestore.collection('Popular_Exercises').doc(itemId);

      // Get current value of 'favorite'
      final snapshot = await docRef.get();

      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      // Check if 'favorite' exists and is a boolean, default to false if missing
      bool currentFavorite = (data != null && data['favorite'] is bool) ? data['favorite'] : false;

      // Toggle favorite value and update Firebase
      await docRef.update({'favorite': !currentFavorite});

      // Re-fetch updated value to confirm the change
      final updatedSnapshot = await docRef.get();
      Map<String, dynamic>? updatedData = updatedSnapshot.data() as Map<String, dynamic>?;
      bool updatedFavorite = (updatedData != null && updatedData['favorite'] is bool) ? updatedData['favorite'] : false;

      emit(FavoriteSuccess(updatedFavorite));
    } catch (e) {
      emit(FavoriteError('Failed to update favorite status'));
    }
  }
}
