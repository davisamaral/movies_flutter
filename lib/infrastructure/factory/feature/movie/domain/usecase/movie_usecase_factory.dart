import 'package:movies_flutter/feature/movie/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_popular_movies.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_popular_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_top_rated_movies.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_top_rated_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_upcoming_movies.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_upcoming_movies_use_case.dart';
import 'package:movies_flutter/infrastructure/factory/feature/movie/domain/repository/movie_repository_factory.dart';

GetPopularMoviesUseCase makeGetMoviesUseCase() {
  return GetPopularMovies(repository: makeMovieRepository());
}

GetNowPlayingMoviesUseCase makeGetNowPlayingMoviesUseCase() {
  return GetNowPlayingMovies(repository: makeMovieRepository());
}

GetUpcomingMoviesUseCase makeGetUpcomingMoviesUseCase() {
  return GetUpcomingMovies(repository: makeMovieRepository());
}

GetTopRatedMoviesUseCase makeGetTopRatedMoviesUseCase() {
  return GetTopRatedMovies(repository: makeMovieRepository());
}
