import 'package:equatable/equatable.dart';
import 'package:nasa_information_app/infra/dto/moon_dto.dart';

class MoonGetAllResponse extends Equatable {
  final List<MoonDto> infoList;

  const MoonGetAllResponse({
    required this.infoList,
  });

  factory MoonGetAllResponse.fromJsonList(List<dynamic> json) =>
      MoonGetAllResponse(
        infoList: json
            .map<MoonDto>(
                (dynamic e) => MoonDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  List<dynamic> toJsonList() =>
      infoList.map<dynamic>((MoonDto e) => e.toJson()).toList();

  @override
  List<Object?> get props => <Object?>[infoList];
}
