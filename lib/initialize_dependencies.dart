import 'package:dio/dio.dart';
import 'package:flutter_application/data/repositoriesImpl/movie_repository_impl.dart';
import 'package:flutter_application/domain/repositories/movie_repository.dart';
import 'package:get_it/get_it.dart';

Future initializeDependencies() async {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org', contentType: 'application/json'));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  GetIt.instance.registerSingleton(dio);
  GetIt.instance.registerSingleton<MovieRepository>(MovieRepositoryImpl());
}
