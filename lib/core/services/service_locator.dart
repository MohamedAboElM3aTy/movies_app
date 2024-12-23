import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));

    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(sl()),
    );

    sl.registerLazySingleton<BaseMovieRepository>(
      () => MoviesRepository(sl()),
    );

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
