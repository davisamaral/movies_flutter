import 'package:movies_flutter/feature/movie/presentation/view/page/movie_list_page.dart';
import 'package:movies_flutter/infrastructure/factory/feature/movie/presentation/viewmodel/movie_view_model_factory.dart';

MovieListPage makeMovieListPage() {
  return MovieListPage(viewModel: makeMovieListViewModel());
}
