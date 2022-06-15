import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviePageWidget extends StatelessWidget {
  const MoviePageWidget({
    required this.movie,
  }) : super(key: null);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        borderOnForeground: true,
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        shadowColor: Colors.black54,
        color: Colors.white,
        child: Container(
          width: double.infinity,
          color: Colors.black12,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: '${movie.backdropPath}',
                fit: BoxFit.cover,
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 36,
                      bottom: 48,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "POPULAR",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              backgroundColor: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 2),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          movie.title ?? "",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            backgroundColor: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          movie.releaseYear,
                          style: GoogleFonts.roboto(
                            color: Colors.white60,
                            backgroundColor: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            wordSpacing: 23,
                            letterSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getStarIcons(double? voteAverage) {
    var average = voteAverage ?? 0;
    var fullStars = average ~/ 2;
    var halfStars = ((average % 2)) >= 0.5 ? 1 : 0;
    var emptyStars = 5 - halfStars - fullStars;

    List<Widget> widgets = [];
    fullStars.repeat(() => widgets.addStarIcon(Icons.star_rounded));
    halfStars.repeat(() => widgets.addStarIcon(Icons.star_half_rounded));
    emptyStars.repeat(() => widgets.addStarIcon(Icons.star_outline_rounded));

    return widgets;
  }
}

extension Stars on List<Widget> {
  addStarIcon(IconData icon) {
    add(
      Icon(
        icon,
        size: 12,
        color: Colors.orange,
      ),
    );
  }
}

extension Repeating on int {
  repeat(Function() func) {
    for (var i = 0; i < this; i++) {
      func();
    }
  }
}
