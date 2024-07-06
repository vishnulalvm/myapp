import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/tabs/details.dart';
import 'package:myapp/services/functions/api_keys.dart';

class CustomList extends StatefulWidget {
  final String searchText;
  final List fullMovies;

  const CustomList({
    super.key,
    required this.searchText,
    required this.fullMovies,
  });

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    if (widget.searchText.isEmpty) {
      return buildMovieList(widget.fullMovies);
    } else if (widget.fullMovies.isEmpty) {
      return buildNoResultsFound();
    } else {
      return buildMovieList(widget.fullMovies);
    }
  }

  Widget buildMovieList(List movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];
        return buildMovieItem(movie);
      },
    );
  }

  Widget buildNoResultsFound() {
    return const Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Oops. We haven't got that.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Try searching for another movie",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget buildMovieItem(Map<String, dynamic> movie) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              moviename: movie['title'] ?? 'No Title',
              image: imageApi + (movie['poster_path'] ?? ''),
              title: 'Popular Movies',
              details: movie['overview'] ?? 'No Details Available',
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 135,
                  child: Image.network(
                    imageApi + (movie['poster_path'] ?? ''),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: ${movie['title'] ?? "No Title"}',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.2,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Release Date: ${movie['release_date'] ?? "N/A"}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Rating: ${movie['vote_average']?.toString() ?? "N/A"}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}