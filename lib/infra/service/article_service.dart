import 'package:nasa_information_app/infra/model/article_model.dart';
import 'package:nasa_information_app/infra/repository/article_repository.dart';
import 'package:nasa_information_app/infra/response/articles_get_all_response.dart';

class ArticleService {
  final ArticlesRepository articlesRepository = ArticlesRepository();

  Future<List<ArticleModel>> getAllArticles() async {
    ArticleGetAllResponse articlesGetAllResponse =
        await articlesRepository.getAllArticles();
    List<ArticleModel> tests = articlesGetAllResponse.testList
        .map((e) => ArticleModel.fromDto(e))
        .toList();
    return tests;
  }
}
