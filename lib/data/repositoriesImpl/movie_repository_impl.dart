import 'package:flutter_application/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:flutter_application/domain/entities/movie_entity.dart';
import 'package:flutter_application/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSource();

  @override
  Future<List<MovieEntity>> getMovies(int page) {
    return movieRemoteDataSource.getMovies(page);
  }
}
