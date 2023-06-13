import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:nasa_information_app/bloc/cubit/moon_state.dart';
import 'package:nasa_information_app/infra/service/moon_service.dart';

class MoonCubit extends Cubit<MoonState> {
  final MoonService _moonService;

  MoonCubit(this._moonService) : super(MoonInitial());

  Future<void> getRandomMoon() async {
    try {
      emit(MoonLoading());
      final moons = await _moonService.getAllInfo();
      if (moons.isNotEmpty) {
        final random = Random();
        final moon = moons[random.nextInt(moons.length)];
        emit(MoonLoaded(moon));
      } else {
        emit(MoonError("No moons found"));
      }
    } catch (e) {
      emit(MoonError("An error occurred while fetching moon data"));
    }
  }
}
