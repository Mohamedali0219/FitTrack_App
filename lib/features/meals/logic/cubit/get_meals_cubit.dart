import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/meals/data/model/meal.dart';
import 'package:fit_track_app/features/meals/data/repository/get_meals_repo.dart';
import 'package:meta/meta.dart';

part 'get_meals_state.dart';

class GetMealsCubit extends Cubit<GetMealsState> {
  GetMealsCubit() : super(GetMealsInitial()) {
    getMealsBreakFast();
  }

  final GetMealsRepo getMealsRepo = GetMealsRepo();

  List<MealModel> meals = [];
  List<NutritionModel> getNutrition = [];

  void getMealsBreakFast() async {
    emit(GetMealsLoading());
    try {
      meals = await getMealsRepo.getMealsBreakFast();
      emit(GetMealsSuccess(meals));
    } catch (e) {
      emit(GetMealsFailed(e.toString()));
    }
  }

  void getMealslunch() async {
    emit(GetMealsLoading());
    try {
      meals = await getMealsRepo.getMealsLunch();
      emit(GetMealsSuccess(meals));
    } catch (e) {
      emit(GetMealsFailed(e.toString()));
    }
  }

  void getMealsDinner() async {
    emit(GetMealsLoading());
    try {
      meals = await getMealsRepo.getMealsDinner();
      emit(GetMealsSuccess(meals));
    } catch (e) {
      emit(GetMealsFailed(e.toString()));
    }
  }
}
