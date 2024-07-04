import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/services/functions/api_functions.dart';
import 'package:myapp/widgets/custom_slider.dart';


// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  DetailsPage(
      {super.key,
      required this.moviename,
      required this.image,
      required this.title,
      required this.details});
  String image;
  String title;
  String details;
  String moviename;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        // title: Text("Search Movies"),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                widget.title,
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              widget.moviename,
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Row(
              children: [
                const Text(
                  "2023",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "U/A 13+",
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(225, 255, 255, 255),
                          color: Colors.black),
                    )),
                const Text(
                  "2h 25m",
                  style: TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.hd,
                  color: Color.fromARGB(255, 255, 255, 255),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                label: const Text(
                  "Play",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.download,
                  color: Colors.white,
                ),
                label: const Text(
                  "Download",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.grey.shade500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(widget.details,
                  style: const TextStyle(color: Colors.white)), //title
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Icon(
                  Icons.thumb_up_sharp,
                  color: Colors.white,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "My List",
                  style: TextStyle(color: Colors.white),
                ),
                Text("Rate", style: TextStyle(color: Colors.white)),
                Text("Share", style: TextStyle(color: Colors.white))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSlider(
                title: "Related Movies", sliderlist: popularMoviesList),
            CustomSlider(title: "Trending Now", sliderlist: topRatedList),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
