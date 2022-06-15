import 'package:movies_flutter/feature/movie/domain/model/movie.dart';

abstract class GetUpcomingMoviesUseCase {
  Future<List<Movie>> call();
}
