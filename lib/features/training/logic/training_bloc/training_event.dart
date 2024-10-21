// exercise_event.dart
import 'package:equatable/equatable.dart';

abstract class TrainingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTrainings extends TrainingEvent {}