import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nasa_information_app/infra/response/moon_get_all_response.dart';

class MoonRepository {
  final Dio webClient =
      Dio(BaseOptions(baseUrl: 'https://raw.githubusercontent.com/'));

  Future<MoonGetAllResponse> getAllArticles() async {
    Response<dynamic> response =
        await webClient.get('/aknowak01/zpsm_server/master/articles/moon.json');
    List<dynamic> responseData = json.decode(response.data);
    return MoonGetAllResponse.fromJsonList(responseData);
  }
}
