// Training_state.dart
import 'package:equatable/equatable.dart';

class PopularExerciseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PopularExerciseLoading extends PopularExerciseState {}

class PopularExerciseLoaded extends PopularExerciseState {
  final List<Map<String, dynamic>> popularExercises;

  PopularExerciseLoaded(this.popularExercises);

  @override
  List<Object?> get props => [popularExercises];
}

class PopularExerciseError extends PopularExerciseState {
  final String message;

  PopularExerciseError(this.message);

  @override
  List<Object?> get props => [message];
}
