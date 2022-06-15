import 'package:movies_flutter/feature/movie/data/repository/default_movie_repository.dart';
import 'package:movies_flutter/feature/movie/domain/repository/movie_repository.dart';

MovieRepository makeMovieRepository() {
  return DefaultMovieRepository();
}
