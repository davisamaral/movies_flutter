import 'dart:math';

import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_popular_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_top_rated_movies_use_case.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_upcoming_movies_use_case.dart';

class GetPopularMoviesMock extends Mock implements GetPopularMoviesUseCase {
  var movies = _getMoviesList(10);
  GetPopularMoviesMock() {
    mockCall(movies);
  }

  void mockCall(List<Movie> movies) {
    when(() => call()).thenAnswer((_) async => movies);
  }
}

class GetTopRatedMoviesMock extends Mock implements GetTopRatedMoviesUseCase {
  var movies = _getMoviesList(10);
  GetTopRatedMoviesMock() {
    mockCall(movies);
  }

  void mockCall(List<Movie> movies) {
    when(() => call()).thenAnswer((_) async => movies);
  }
}

class GetUpcomingMoviesMock extends Mock implements GetUpcomingMoviesUseCase {
  var movies = _getMoviesList(10);
  GetUpcomingMoviesMock() {
    mockCall(movies);
  }

  void mockCall(List<Movie> movies) {
    when(() => call()).thenAnswer((_) async => movies);
  }
}

class GetNowPlayingMoviesMock extends Mock implements GetNowPlayingMoviesUseCase {
  var movies = _getMoviesList(10);
  GetNowPlayingMoviesMock() {
    mockCall(movies);
  }

  void mockCall(List<Movie> movies) {
    when(() => call()).thenAnswer((_) async => movies);
  }
}

Movie _makeMovie(int index) {
  return Movie(
    adult: false,
    backdropPath: "http://teste-$index.jpg",
    genreIds: [Random().nextInt(100), Random().nextInt(100)],
    id: index,
    originalLanguage: "en",
    originalTitle: "Movie Title",
    overview: "Bla bla",
    popularity: Random().nextDouble(),
    posterPath: "http://teste-$index.jpg",
    releaseDate: "01/01/1970",
    title: "Movie Title",
    video: Random().nextBool(),
    voteAverage: Random().nextDouble(),
    voteCount: Random().nextInt(1000),
  );
}

List<Movie> _getMoviesList(int size) =>
    Iterable<int>.generate(10).toList().map((e) => _makeMovie(e)).toList();