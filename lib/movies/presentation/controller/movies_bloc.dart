import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_Event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase.execute();
        result.fold(
          (l) => emit(
            MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            ),
          ),
          (r) => emit(
            MoviesState(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            ),
          ),
        );
      },
    );

    on<GetPopularMoviesEvent>(
      (event, emit) async {
        final result = await getTopRatedMoviesUseCase.execute();
        result.fold(
          (l) => emit(
            MoviesState(
              popularState: RequestState.error,
              popularMessage: l.message,
            ),
          ),
          (r) => emit(
            MoviesState(
              popularMovies: r,
              popularState: RequestState.loaded,
            ),
          ),
        );
      },
    );

    on<GetTopRatedMoviesEvent>(
      (event, emit) async {
        final result = await getTopRatedMoviesUseCase.execute();
        result.fold(
          (l) => emit(
            MoviesState(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            ),
          ),
          (r) => emit(
            MoviesState(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            ),
          ),
        );
      },
    );
  }
}
