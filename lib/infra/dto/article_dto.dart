import 'package:equatable/equatable.dart';

class ArticleDto extends Equatable {
  final String title;
  final String text;
  final String id;

  const ArticleDto({
    required this.title,
    required this.text,
    required this.id,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) => ArticleDto(
        title: json['title'],
        text: json['text'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'text': text,
        'id': id,
      };

  @override
  List<Object?> get props => <Object?>[title, text, id];
}
