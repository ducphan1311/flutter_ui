import 'package:flutter_application/domain/entities/movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto extends MovieEntity {
  @override
  @JsonKey(name: 'id')
  int? id;

  @override
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @override
  @JsonKey(name: 'release_date')
  String? releaseDate;

  @override
  @JsonKey(name: 'title')
  String? title;

  @override
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  MovieDto(
      this.id, this.posterPath, this.releaseDate, this.title, this.voteAverage);

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}
