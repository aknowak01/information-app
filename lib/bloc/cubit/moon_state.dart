import '../../infra/model/moon_model.dart';

abstract class MoonState {}

class MoonInitial extends MoonState {}

class MoonLoading extends MoonState {}

class MoonLoaded extends MoonState {
  final MoonModel moon;

  MoonLoaded(this.moon);
}

class MoonError extends MoonState {
  final String message;

  MoonError(this.message);
}
