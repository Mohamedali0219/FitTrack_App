import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/training/logic/popular_exercise_bloc/popular_exercise_event.dart';
import 'package:fit_track_app/features/training/logic/popular_exercise_bloc/popular_exercise_state.dart';

import '../services/popular_exercise_servcies.dart';

class PopularExerciseBloc extends Bloc<PopularExerciseEvent, PopularExerciseState> {
  final PopularExerciseService _popularExerciseService;
  final PopularExerciseImageService _popularExerciseImageService;

  PopularExerciseBloc(this._popularExerciseService, this._popularExerciseImageService) : super(PopularExerciseLoading()) {
    on<FetchPopularExercises>(_onFetchPopularExercise);
  }

  Future<void> _onFetchPopularExercise(FetchPopularExercises event, Emitter<PopularExerciseState> emit) async {
    try {
      emit(PopularExerciseLoading());

      List<Map<String, dynamic>> popularExercises = await _popularExerciseService.getPopularExercises();

      for (var popularExercise in popularExercises) {
        String imageUrl = await _popularExerciseImageService.getPopularExerciseImageUrl(popularExercise['imagePath']);
        popularExercise['imageUrl'] = imageUrl; // Add imageUrl to each category map
      }

      emit(PopularExerciseLoaded(popularExercises));
    } catch (e) {
      emit(PopularExerciseError(e.toString()));
    }
  }
}
