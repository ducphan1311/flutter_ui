import 'dart:async';

import 'package:flutter_application/domain/entities/movie_entity.dart';
import 'package:flutter_application/domain/repositories/movie_repository.dart';
import 'package:flutter_stream_paging/data_source/data_source.dart';
import 'package:tuple/tuple.dart';

class ListViewDataSource extends DataSource<int, MovieEntity> {
  MovieRepository movieRepository;

  ListViewDataSource(this.movieRepository);

  @override
  Future<Tuple2<List<MovieEntity>, int>> loadInitial(int pageSize) async {
    return Tuple2(await movieRepository.getMovies(1), 2);
  }

  @override
  Future<Tuple2<List<MovieEntity>, int>> loadPageAfter(
      int params, int pageSize) async {
    return Tuple2(await movieRepository.getMovies(params), params + 1);
  }
}
