import 'package:equatable/equatable.dart';
import 'package:nasa_information_app/infra/dto/article_dto.dart';

class ArticleGetAllResponse extends Equatable {
  final List<ArticleDto> testList;

  const ArticleGetAllResponse({
    required this.testList,
  });

  factory ArticleGetAllResponse.fromJsonList(List<dynamic> json) =>
      ArticleGetAllResponse(
        testList: json
            .map<ArticleDto>(
                (dynamic e) => ArticleDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  List<dynamic> toJsonList() =>
      testList.map<dynamic>((ArticleDto e) => e.toJson()).toList();

  @override
  List<Object?> get props => <Object?>[testList];
}
