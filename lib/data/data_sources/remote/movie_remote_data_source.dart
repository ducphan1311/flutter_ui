import 'package:dio/dio.dart';
import 'package:flutter_application/data/dtos/movie_dto.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/movie_entity.dart';

class MovieRemoteDataSource {
  final Dio dio = GetIt.instance.get();

  Future<List<MovieEntity>> getMovies(int page) async {
    final response = await dio.get(
        '/3/discover/movie?api_key=26763d7bf2e94098192e629eb975dab0&page=$page');
    return (response.data['results'] as List<dynamic>?)
            ?.map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }
}
