import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_flutter/feature/movie/domain/model/movie.dart';
import 'package:movies_flutter/feature/movie/presentation/view/widget/horizontal_movie_list_item_widget.dart';

class HorizontalMovieListWidget extends StatelessWidget {
  const HorizontalMovieListWidget({
    required this.movies,
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Text(label, style: GoogleFonts.roboto(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
        ),
        SizedBox(
          height: 266,
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 18, left: 12),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(width: 4),
            itemBuilder: (context, index) {
              return HorizontalMovieListItemWidget(movie: movies[index]);
            },
          ),
        ),
        const Padding(
          padding:  EdgeInsets.only(top: 18, left: 16, right: 16),
          child: Divider(height: 2, color: Colors.black26,),
        ),
      ],
    );
  }
}
