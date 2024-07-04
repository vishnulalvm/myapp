import 'package:flutter/material.dart';
import 'package:myapp/pages/tabs/home.dart';
import 'package:myapp/services/functions/api_functions.dart';
import 'package:myapp/widgets/comming_soon.dart';
import 'package:myapp/widgets/custom_grid.dart';
import 'package:myapp/widgets/tab_bar.dart';


class NewsHotScreen extends StatefulWidget {
  const NewsHotScreen({super.key});

  @override
  State<NewsHotScreen> createState() => _NewsHotScreenState();
}

class _NewsHotScreenState extends State<NewsHotScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'News & Hot',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: ValueListenableBuilder(
                  valueListenable: tabNotifier,
                  builder: (context, isTabBarVisible, _) {
                    return isTabBarVisible
                        ? HomeTabBar(
                            first: 'Comming Soon🍿',
                            second: 'Most Watching🔥',
                          )
                        : const SizedBox();
                  }),
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
                child: CustomCommingSoon(
              gridList: popularMoviesList,
            )),
            SingleChildScrollView(
                child: CustomGrid(
              gridList: topRatedList,
            ))
          ])),
    );
  }
}
