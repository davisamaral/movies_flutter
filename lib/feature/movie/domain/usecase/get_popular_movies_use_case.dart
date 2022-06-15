import 'package:movies_flutter/feature/movie/domain/model/movie.dart';

abstract class GetPopularMoviesUseCase {
  Future<List<Movie>> call();
}
