import 'package:equatable/equatable.dart';
import 'package:nasa_information_app/infra/dto/moon_dto.dart';

class MoonModel extends Equatable {
  final String data;
  final String name;
  final String text;

  const MoonModel._({
    required this.data,
    required this.name,
    required this.text,
  });

  factory MoonModel.fromDto(MoonDto dto) => MoonModel._(
        data: dto.data,
        name: dto.name,
        text: dto.text,
      );

  @override
  String toString() {
    return 'data: $data, name: $name, text: $text';
  }

  @override
  List<Object?> get props => <Object?>[data, name, text];
}
