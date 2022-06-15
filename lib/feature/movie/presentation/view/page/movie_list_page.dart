import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/presentation/view/widget/movie_list_widget.dart';
import 'package:movies_flutter/feature/movie/presentation/viewmodel/movie_list_view_model.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({required this.viewModel, Key? key}) : super(key: key);

  final MovieListViewModel viewModel;

  static const String id = '/movies_screen';

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> _popularMovies = List.empty();
  List<Movie> _topRatedMovies = List.empty();
  List<Movie> _nowPlayingMovies = List.empty();
  List<Movie> _upcomingMovies = List.empty();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() {
    setState(() {
      _isLoading = true;
    });
    widget.viewModel.loadMovies(onMoviesLoaded, onLoadMoviesError);
  }

  onLoadMoviesError() {
    displaySnackBarMessage(
      AppLocalizations.of(context)?.moviesErrorOnLoadMessage ?? "",
    );
  }

  onMoviesLoaded(
    List<Movie> popularMovies,
    List<Movie> topRatedMovies,
    List<Movie> nowPlayingMovies,
    List<Movie> upcomingMovies,
  ) {
    setState(() {
      _popularMovies = popularMovies;
      _topRatedMovies = topRatedMovies;
      _nowPlayingMovies = nowPlayingMovies;
      _upcomingMovies = upcomingMovies;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MovieListWidget(
      isLoading: _isLoading,
      popularMovies: _popularMovies,
      topRatedMovies: _topRatedMovies,
      nowPlayingMovies: _nowPlayingMovies,
      upcomingMovies: _upcomingMovies,
    );
  }

  displaySnackBarMessage(String message) {
    var snackBar = SnackBar(
      duration: const Duration(milliseconds: 1000),
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: Colors.red,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
