import 'package:bloc/bloc.dart';
import 'package:nasa_information_app/bloc/cubit/articles_state.dart';
import 'package:nasa_information_app/infra/model/article_model.dart';
import 'package:nasa_information_app/infra/service/article_service.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticleService _articleService = ArticleService();

  ArticlesCubit() : super(ArticlesInitial());

  Future<void> getArticles() async {
    try {
      emit(ArticlesLoading());
      final List<ArticleModel> articles =
          await _articleService.getAllArticles();
      emit(ArticlesLoaded(articles: articles));
    } catch (e) {
      emit(ArticlesError(message: e.toString()));
    }
  }
}
