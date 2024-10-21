import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:flutter/material.dart';

class GetMealsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MealModel>> getMealsBreakFast() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('meals').where('mealType', isEqualTo: 'Breakfast').get();
      List<MealModel> meals = querySnapshot.docs.map((doc) {
        return MealModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      return meals;
    } catch (e) {
      debugPrint("Failed to fetch meals: $e");
      return [];
    }
  }

    Future<List<MealModel>> getMealsLunch() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('meals').where('mealType', isEqualTo: 'Lunch').get();
      List<MealModel> meals = querySnapshot.docs.map((doc) {
        return MealModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      return meals;
    } catch (e) {
      debugPrint("Failed to fetch meals: $e");
      return [];
    }
  }


    Future<List<MealModel>> getMealsDinner() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('meals').where('mealType', isEqualTo: 'Dinner').get();
      List<MealModel> meals = querySnapshot.docs.map((doc) {
        return MealModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      return meals;
    } catch (e) {
      debugPrint("Failed to fetch meals: $e");
      return [];
    }
  }
}