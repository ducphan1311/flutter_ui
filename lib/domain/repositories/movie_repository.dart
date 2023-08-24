import 'package:flutter_application/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies(int page);
}
