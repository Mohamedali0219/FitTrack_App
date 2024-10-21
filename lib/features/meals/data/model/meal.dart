// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealModel {
  final String id;
  final String name;
  final String description;
  final String mealType;
  final double calories;

  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.mealType,
    required this.calories,
  });

  factory MealModel.fromFirestore(Map<String, dynamic> data, String id) {
    return MealModel(
      id: id,
      name: data['name'] as String,
      description: data['description'] as String,
      mealType: data['mealType'] as String,
      calories: (data['calories'] is int)
          ? (data['calories'] as int).toDouble()
          : data['calories'] as double,
    );
  }

  @override
  bool operator ==(covariant MealModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.mealType == mealType &&
        other.calories == calories;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        mealType.hashCode ^
        calories.hashCode;
  }
}

class NutritionModel {
  double fat;
  double protein;
  double carbs;

  NutritionModel({
    required this.fat,
    required this.protein,
    required this.carbs,
  });

  // Factory method to create Nutrition object from Firestore data
  factory NutritionModel.fromMap(Map<String, dynamic> data) {
    return NutritionModel(
      fat: data['fat'],
      protein: data['protein'],
      carbs: data['carbs'],
    );
  }

  // Method to convert Nutrition object into a map to send to Firestore
  Map<String, dynamic> toMap() {
    return {
      'fat': fat,
      'protein': protein,
      'carbs': carbs,
    };
  }

  @override
  bool operator ==(covariant NutritionModel other) {
    if (identical(this, other)) return true;

    return other.fat == fat && other.protein == protein && other.carbs == carbs;
  }

  @override
  int get hashCode => fat.hashCode ^ protein.hashCode ^ carbs.hashCode;
}
