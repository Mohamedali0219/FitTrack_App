part of 'get_meals_cubit.dart';

@immutable
sealed class GetMealsState {}

final class GetMealsInitial extends GetMealsState {}


final class GetMealsLoading extends GetMealsState {}


final class GetMealsSuccess extends GetMealsState {
  final List<MealModel> meals;

  GetMealsSuccess(this.meals);
}


final class GetMealsFailed extends GetMealsState {
  final String error;

  GetMealsFailed(this.error);
}
