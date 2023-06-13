import 'package:equatable/equatable.dart';

class MoonDto extends Equatable {
  final String data;
  final String name;
  final String text;

  const MoonDto({
    required this.data,
    required this.name,
    required this.text,
  });

  factory MoonDto.fromJson(Map<String, dynamic> json) => MoonDto(
        data: json['data'],
        name: json['name'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        'data': data,
        'name': name,
        'text': text,
      };

  @override
  List<Object?> get props => <Object?>[data, name, text];
}
