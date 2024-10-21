import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/exercise/logic/exercise_bloc/exercise_state.dart';
import 'package:fit_track_app/features/exercise/logic/services/exercise_services.dart';

import 'exercise_event.dart';


class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseService _exerciseService;
  final ExerciseImageService _exerciseImageService;

  ExerciseBloc(this._exerciseService, this._exerciseImageService) : super(ExerciseLoading()) {
    on<FetchExercises>(_onFetchExercise);
  }

  Future<void> _onFetchExercise(FetchExercises event, Emitter<ExerciseState> emit) async {
    try {
      emit(ExerciseLoading());

      List<Map<String, dynamic>> exercises = await _exerciseService.getExercises();

      for (var exercise in exercises) {
        String imageUrl = await _exerciseImageService.getExerciseImageUrl(exercise['imagePath']);
        exercise['imageUrl'] = imageUrl; // Add imageUrl to each category map
      }

      emit(ExerciseLoaded(exercises));
    } catch (e) {
      emit(ExerciseError(e.toString()));
    }
  }
}
