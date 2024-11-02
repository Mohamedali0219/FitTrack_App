part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final bool isFavorite;
  FavoriteSuccess(this.isFavorite);
}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}