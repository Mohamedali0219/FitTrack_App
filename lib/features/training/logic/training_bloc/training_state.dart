// Training_state.dart
import 'package:equatable/equatable.dart';

class TrainingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrainingLoading extends TrainingState {}

class TrainingLoaded extends TrainingState {
  final List<Map<String, dynamic>> trainings;

  TrainingLoaded(this.trainings);

  @override
  List<Object?> get props => [trainings];
}

class TrainingError extends TrainingState {
  final String message;

  TrainingError(this.message);

  @override
  List<Object?> get props => [message];
}
