import 'package:flutter/material.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/presentation/view/widget/movie_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MoviePagerWidget extends StatelessWidget {
  const MoviePagerWidget({
    required this.movies,
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            pageSnapping: true,
            clipBehavior: Clip.hardEdge,
            children: movies.map((e) => MoviePageWidget(movie: e)).toList(),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(26),
            alignment: AlignmentDirectional.bottomCenter,
            child: SmoothPageIndicator(
              controller: controller,
              count: movies.length,
              effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                type: WormType.normal,
                // strokeWidth: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
