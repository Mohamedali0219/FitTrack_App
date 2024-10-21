import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/training/logic/training_bloc/training_event.dart';
import 'package:fit_track_app/features/training/logic/training_bloc/training_state.dart';

import '../services/training_servcies.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingService _trainingService;
  final TrainingImageService _trainingImageService;

  TrainingBloc(this._trainingService, this._trainingImageService) : super(TrainingLoading()) {
    on<FetchTrainings>(_onFetchTraining);
  }

  Future<void> _onFetchTraining(FetchTrainings event, Emitter<TrainingState> emit) async {
    try {
      emit(TrainingLoading());

      List<Map<String, dynamic>> trainings = await _trainingService.getTrainings();

      for (var training in trainings) {
        String imageUrl = await _trainingImageService.getTrainingImageUrl(training['imagePath']);
        training['imageUrl'] = imageUrl; // Add imageUrl to each category map
      }

      emit(TrainingLoaded(trainings));
    } catch (e) {
      emit(TrainingError(e.toString()));
    }
  }
}
