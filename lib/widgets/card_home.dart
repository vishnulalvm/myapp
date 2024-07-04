import 'package:flutter/material.dart';
import 'package:myapp/services/functions/api_keys.dart';


Stack cardHome() {
  return Stack(
    children: [
      Container(
        height: 400,
        width: 310,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                homeCard,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 0.5, color: Colors.white)),
      ),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 324,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              playButtonHome(),
              homeButton(),
            ],
          ))
    ],
  );
}

TextButton homeButton() {
  return TextButton.icon(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
        Colors.white24,
      )),
      onPressed: () {},
      icon: const Icon(
        Icons.add,
        color: Color.fromARGB(225, 255, 255, 255),
      ),
      label: const Text(
        "My List",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ));
}

TextButton playButtonHome() {
  return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          "Play",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ));
}
