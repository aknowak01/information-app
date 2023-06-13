import '../../infra/model/article_model.dart';

abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final List<ArticleModel> articles;

  ArticlesLoaded({required this.articles});
}

class ArticlesError extends ArticlesState {
  final String message;

  ArticlesError({required this.message});
}
