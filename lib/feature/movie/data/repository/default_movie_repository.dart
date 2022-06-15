import 'dart:convert';
import 'dart:ui' as ui;

import 'package:http/http.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/domain/repository/movie_repository.dart';

class DefaultMovieRepository implements MovieRepository {
  final String countryCode = ui.window.locale.countryCode ?? "BR";
  final String locale = ui.window.locale.toString().replaceAll('_', '-');
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String apiKey = 'aac815133e3d463967c816e5a637bc34';

  @override
  Future<List<Movie>> getNowPlayingMovies() {
    return getMovies('now_playing');
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    return getMovies('top_rated');
  }

  @override
  Future<List<Movie>> getUpcomingMovies() {
    return getMovies('upcoming');
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    return getMovies('popular');
  }

  Future<List<Movie>> getMovies(String path) async {
    var movieURI = Uri.parse(buildUri(path));
    var response = await Client().get(movieURI);
    var responseJson = jsonDecode(response.body);
    return responseJson['results']
        .map<Movie>((e) => Movie.fromJson(e))
        .toList();
  }

  String buildUri(String path) {
    return '$baseUrl$path?api_key=$apiKey&language=$locale&page=1&region=$countryCode';
  }
}
