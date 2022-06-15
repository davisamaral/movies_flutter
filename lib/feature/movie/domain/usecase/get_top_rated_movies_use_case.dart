import 'package:movies_flutter/feature/movie/domain/model/movie.dart';

abstract class GetTopRatedMoviesUseCase {
  Future<List<Movie>> call();
}
