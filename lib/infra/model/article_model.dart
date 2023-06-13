import 'package:equatable/equatable.dart';
import 'package:nasa_information_app/infra/dto/article_dto.dart';

class ArticleModel extends Equatable {
  final String title;
  final String text;
  final String id;

  const ArticleModel._({
    required this.title,
    required this.text,
    required this.id,
  });

  factory ArticleModel.fromDto(ArticleDto dto) => ArticleModel._(
        title: dto.title,
        text: dto.text,
        id: dto.id,
      );

  @override
  String toString() {
    return 'title: $title, text: $text, id: $id';
  }

  @override
  List<Object?> get props => <Object?>[title, text, id];
}
