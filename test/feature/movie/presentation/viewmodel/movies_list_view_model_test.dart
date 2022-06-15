import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_popular_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_top_rated_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_upcoming_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/presentation/viewmodel/movie_list_view_model.dart';

import '../mocks/mocks.dart';

void main() {
  late MovieListViewModel sut;
  late GetPopularMoviesUseCase getPopularMovies;
  late GetTopRatedMoviesUseCase getTopRatedMovies;
  late GetNowPlayingMoviesUseCase getNowPlayingMovies;
  late GetUpcomingMoviesUseCase getUpcomingMovies;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    getPopularMovies = GetPopularMoviesMock();
    getTopRatedMovies = GetTopRatedMoviesMock();
    getNowPlayingMovies = GetNowPlayingMoviesMock();
    getUpcomingMovies = GetUpcomingMoviesMock();
    sut = MovieListViewModel(
      getPopularMovies: getPopularMovies,
      getTopRatedMovies: getTopRatedMovies,
      getNowPlayingMovies: getNowPlayingMovies,
      getUpcomingMovies: getUpcomingMovies,
    );
  });
  Function(List<Movie>, List<Movie>, List<Movie>, List<Movie>) onMoviesLoaded =
      (p0, p1, p2, p3) => null;
  Function() onMoviesLoadError = () => null;

  test('Should call getPopularMovies on load movies', () async {
    sut.loadMovies(onMoviesLoaded, onMoviesLoadError);
    verify(() => getPopularMovies.call());
  });

  test('Should call getTopRatedMovies on load movies', () async {
    sut.loadMovies(onMoviesLoaded, onMoviesLoadError);
    verify(() => getTopRatedMovies.call());
  });

  test('Should call getNowPlayingMovies on load movies', () async {
    sut.loadMovies(onMoviesLoaded, onMoviesLoadError);
    verify(() => getNowPlayingMovies.call());
  });

  test('Should call getUpcomingMovies on load movies', () async {
    sut.loadMovies(onMoviesLoaded, onMoviesLoadError);
    verify(() => getUpcomingMovies.call());
  });
}
