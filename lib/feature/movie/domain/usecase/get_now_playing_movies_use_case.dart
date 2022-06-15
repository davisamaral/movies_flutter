import 'package:movies_flutter/feature/movie/domain/model/movie.dart';

abstract class GetNowPlayingMoviesUseCase {
  Future<List<Movie>> call();
}
