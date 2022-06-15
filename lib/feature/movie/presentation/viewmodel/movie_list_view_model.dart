import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_popular_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_top_rated_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_upcoming_movies_use_case.dart';

class MovieListViewModel {
  MovieListViewModel({
    required this.getPopularMovies,
    required this.getTopRatedMovies,
    required this.getNowPlayingMovies,
    required this.getUpcomingMovies,
  });

  GetPopularMoviesUseCase getPopularMovies;
  GetTopRatedMoviesUseCase getTopRatedMovies;
  GetNowPlayingMoviesUseCase getNowPlayingMovies;
  GetUpcomingMoviesUseCase getUpcomingMovies;

  loadMovies(
    Function(List<Movie>, List<Movie>, List<Movie>, List<Movie>) onMoviesLoaded,
    Function() onMoviesLoadError,
  ) async {
    Future.wait(
      [
        getPopularMovies(),
        getTopRatedMovies(),
        getNowPlayingMovies(),
        getUpcomingMovies(),
      ],
    ).then((value) => onMoviesLoaded(
          value[0],
          value[1],
          value[2],
          value[3],
        ));
  }
}
