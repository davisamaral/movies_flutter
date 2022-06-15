import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/presentation/view/widget/horizontal_movie_list_widget.dart';
import 'package:movies_flutter/feature/movie/presentation/view/widget/movie_pager_widget.dart';
import 'package:movies_flutter/infrastructure/factory/feature/app/presentation/view/widget/app_widget_factory.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    required this.isLoading,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.nowPlayingMovies,
    required this.upcomingMovies,
    Key? key,
  }) : super(key: key);

  final bool isLoading;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> nowPlayingMovies;
  final List<Movie> upcomingMovies;

  List<Movie> getPopularMoviesSubList() {
    var length = 0;
    if (popularMovies.isNotEmpty) {
      length = min(6, popularMovies.length - 1);
    }
    return popularMovies.sublist(0, length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: makeLoggedAppBar(),
      body: Stack(
        children: [
          Visibility(
            visible: isLoading,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                MoviePagerWidget(
                  movies: getPopularMoviesSubList(),
                  label: AppLocalizations.of(context)?.popularMoviesLabel ?? "",
                ),
                HorizontalMovieListWidget(
                  movies: topRatedMovies,
                  label:
                      AppLocalizations.of(context)?.topRatedMoviesLabel ?? "",
                ),
                HorizontalMovieListWidget(
                  movies: nowPlayingMovies,
                  label:
                      AppLocalizations.of(context)?.nowPlayingMoviesLabel ?? "",
                ),
                HorizontalMovieListWidget(
                  movies: upcomingMovies,
                  label:
                      AppLocalizations.of(context)?.upcomingMoviesLabel ?? "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
