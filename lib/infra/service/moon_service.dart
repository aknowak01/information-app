import 'dart:math';

import 'package:nasa_information_app/infra/model/moon_model.dart';
import 'package:nasa_information_app/infra/repository/moon_repository.dart';
import 'package:nasa_information_app/infra/response/moon_get_all_response.dart';

class MoonService {
  final MoonRepository moonRepository = MoonRepository();

  Future<List<MoonModel>> getAllInfo() async {
    MoonGetAllResponse moonGetAllResponse =
        await moonRepository.getAllArticles();
    List<MoonModel> tests =
        moonGetAllResponse.infoList.map((e) => MoonModel.fromDto(e)).toList();
    return tests;
  }

  Future<MoonModel> getRandomInfo() async {
    List<MoonModel> allArticles = await getAllInfo();
    return allArticles[Random().nextInt(allArticles.length)];
  }
}
