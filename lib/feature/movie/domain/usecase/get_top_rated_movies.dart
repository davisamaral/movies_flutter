import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/domain/repository/movie_repository.dart';
import 'package:movies_flutter/feature/movie/domain/usecase/get_top_rated_movies_use_case.dart';

class GetTopRatedMovies implements GetTopRatedMoviesUseCase {
  GetTopRatedMovies({required this.repository});

  MovieRepository repository;

  @override
  Future<List<Movie>> call() {
    return repository.getTopRatedMovies();
  }
}
