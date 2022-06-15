import 'package:movies_flutter/feature/movie/presentation/viewmodel/movie_list_view_model.dart';
import 'package:movies_flutter/infrastructure/factory/feature/movie/domain/usecase/movie_usecase_factory.dart';

MovieListViewModel makeMovieListViewModel() {
  return MovieListViewModel(
    getPopularMovies: makeGetMoviesUseCase(),
    getNowPlayingMovies: makeGetNowPlayingMoviesUseCase(),
    getTopRatedMovies: makeGetTopRatedMoviesUseCase(),
    getUpcomingMovies: makeGetUpcomingMoviesUseCase(),
  );
}
