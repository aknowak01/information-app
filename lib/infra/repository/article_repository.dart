import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nasa_information_app/infra/response/articles_get_all_response.dart';

class ArticlesRepository {
  final Dio webClient =
      Dio(BaseOptions(baseUrl: 'https://raw.githubusercontent.com/'));

  Future<ArticleGetAllResponse> getAllArticles() async {
    Response<dynamic> response = await webClient
        .get('/aknowak01/zpsm_server/master/articles/articles.json');
    List<dynamic> responseData = json.decode(response.data);
    return ArticleGetAllResponse.fromJsonList(responseData);
  }
}
