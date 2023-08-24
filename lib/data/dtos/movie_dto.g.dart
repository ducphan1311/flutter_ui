// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => MovieDto(
      json['id'] as int?,
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieDtoToJson(MovieDto instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
