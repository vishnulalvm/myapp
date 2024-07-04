// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/services/functions/api_functions.dart';
import 'package:myapp/widgets/card_home.dart';
import 'package:myapp/widgets/custom_slider.dart';
import 'package:myapp/widgets/tab_bar.dart';


ValueNotifier<bool> tabNotifier = ValueNotifier(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: RefreshIndicator(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {});
          });
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 25,
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            leading: Image.network(
                'https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456'),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: ValueListenableBuilder(
                    valueListenable: tabNotifier,
                    builder: (context, isTabBarVisible, _) {
                      return isTabBarVisible
                          ? HomeTabBar(
                              first: 'Tv Shows',
                              second: 'Movies',
                              third: 'Categories',
                            )
                          : SizedBox();
                    })),
          ),
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                tabNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                tabNotifier.value = true;
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 119,
                    ),
                    Center(
                      child: cardHome(),
                    ),
                    CustomSlider(
                        title: 'Now Playing', sliderlist: nowplayinglist),
                    CustomSlider(title: 'Top Rated ', sliderlist: topRatedList),
                    //CustomSlider(title: 'Top Rated ', sliderlist: allMoviesList)
                    // CustomGrid(title: 'title', gridList: nowplayinglist)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
