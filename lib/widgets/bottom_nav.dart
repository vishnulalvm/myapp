import 'package:flutter/material.dart';
import 'package:myapp/pages/tabs/games.dart';
import 'package:myapp/pages/tabs/home.dart';
import 'package:myapp/pages/tabs/news_hot.dart';
import 'package:myapp/pages/tabs/proflie.dart';
import 'package:myapp/utils/colors.dart';


class MyBottom extends StatefulWidget {
  const MyBottom({super.key});

  @override
  State<MyBottom> createState() => _MyBottomState();
}

class _MyBottomState extends State<MyBottom> {
  int indexNum = 0;
  List screen = [
    const HomeScreen(),
    const GamesScreen(),
    const NewsHotScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen.elementAt(indexNum),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.black,
        items: const [
          //item:1
          BottomNavigationBarItem(
            icon: InkResponse(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Icon(Icons.home_outlined)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: InkResponse(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Icon(Icons.sports_esports_outlined)),
              label: "Games"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined), label: "News & hot"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "My Netflix"),
        ],
        currentIndex: indexNum,

        showSelectedLabels: true,
        iconSize: 30,
        showUnselectedLabels: true,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
      ),
    );
  }
}
