// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/tabs/details.dart';
import 'package:myapp/services/functions/api_keys.dart';


// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  String title;
  List<Map<String, dynamic>> sliderlist;
  CustomSlider({super.key, required this.title, required this.sliderlist});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 13,
            ),
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.sliderlist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (details) => DetailsPage(
                                    moviename: widget.sliderlist[index]
                                        ['title'],
                                    image: imageApi +
                                        widget.sliderlist[index]['poster_path'],
                                    title: widget.title,
                                    details: widget.sliderlist[index]
                                        ['overview'])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.network(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                imageApi +
                                    widget.sliderlist[index]['poster_path']),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}
