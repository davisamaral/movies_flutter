import 'package:movies_flutter/feature/movie/domain/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getNowPlayingMovies();
}
