import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class HorizontalMovieListItemWidget extends StatelessWidget {
  const HorizontalMovieListItemWidget({
    required this.movie,
  }) : super(key: null);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => print('movie pressed'),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 178,
                color: Colors.black12,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: '${movie.posterPath}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${movie.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie.releaseYear,
                      style: GoogleFonts.roboto(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: getStarIcons(movie.voteAverage),
                    ),
                  ],
                ),
              ),
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
