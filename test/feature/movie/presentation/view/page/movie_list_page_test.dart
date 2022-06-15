import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_flutter/feature/movie/presentation/view/page/movie_list_page.dart';
import 'package:movies_flutter/feature/movie/presentation/viewmodel/movie_list_view_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../mocks/mocks.dart';

void main() {
  late MovieListViewModel viewModel;

  var getPopularMovies = GetPopularMoviesMock();
  var getTopRatedMovies = GetTopRatedMoviesMock();
  var getNowPlayingMovies = GetNowPlayingMoviesMock();
  var getUpcomingMovies = GetUpcomingMoviesMock();

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    getPopularMovies = GetPopularMoviesMock();
    getTopRatedMovies = GetTopRatedMoviesMock();
    getNowPlayingMovies = GetNowPlayingMoviesMock();
    getUpcomingMovies = GetUpcomingMoviesMock();
    viewModel = MovieListViewModel(
      getPopularMovies: getPopularMovies,
      getTopRatedMovies: getTopRatedMovies,
      getNowPlayingMovies: getNowPlayingMovies,
      getUpcomingMovies: getUpcomingMovies,
    );
  });

  testWidgets('Should show popular movies list', (WidgetTester tester) async {
    await tester.pumpWidget(
      FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          return MaterialApp(
            home: MovieListPage(viewModel: viewModel),
          );
        },
      ),
    );
    await mockNetworkImagesFor(() async => await tester.pump());
    expect("Popular Movies", findsOneWidget);
  });

  testWidgets('Should show top rated movies list', (WidgetTester tester) async {
    await tester.pumpWidget(
      FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          return MaterialApp(
            home: MovieListPage(viewModel: viewModel),
          );
        },
      ),
    );
    await mockNetworkImagesFor(() async => await tester.pump());
    expect(find.text(getTopRatedMovies.movies[0].title ?? ""), findsOneWidget);
  });

  testWidgets('Should show now playing movies list', (WidgetTester tester) async {
    await tester.pumpWidget(
      FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          return MaterialApp(
            home: MovieListPage(viewModel: viewModel),
          );
        },
      ),
    );
    await mockNetworkImagesFor(() async => await tester.pump());
    expect(find.text(getNowPlayingMovies.movies[0].title ?? ""), findsOneWidget);
  });

  testWidgets('Should show upcoming movies list', (WidgetTester tester) async {
    await tester.pumpWidget(
      FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          return MaterialApp(
            home: MovieListPage(viewModel: viewModel),
          );
        },
      ),
    );
    await mockNetworkImagesFor(() async => await tester.pump());
    expect(find.text(getUpcomingMovies.movies[0].title ?? ""), findsOneWidget);
  });
}
