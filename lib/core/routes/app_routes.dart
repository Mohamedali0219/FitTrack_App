import 'package:fit_track_app/core/routes/routes.dart';
import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:fit_track_app/features/meals/ui/meals_detials_screen.dart';
import 'package:fit_track_app/features/meals/ui/meals_screen.dart';
import 'package:fit_track_app/features/training/ui/training_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
      // return MaterialPageRoute(builder: (_) => const Scaffold());

      case Routes.mealsScreen:
        return MaterialPageRoute(builder: (_) => const MealsScreen());

      case Routes.mealDetailScreen:
        var mealModel = settings.arguments as MealModel;
        return MaterialPageRoute(
            builder: (_) => MealsDetialsScreen(mealModel: mealModel));

      case Routes.trainingScreen:
        return MaterialPageRoute(builder: (_) => const TrainingScreen());
    }
    return null;
  }
}
