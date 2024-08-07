import 'package:flutter/material.dart';

class HomeTabBar extends StatefulWidget {
  final String? first;
  final String? second;
  final String? third;
  const HomeTabBar({
    super.key,
    this.first,
    this.second,
    this.third,
  });

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        if (widget.first != null) Tab(text: widget.first),
        if (widget.second != null) Tab(text: widget.second),
        if (widget.third != null) Tab(text: widget.third),
      ],
      labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      dividerColor: Colors.black,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.white,
      isScrollable: true,
      labelColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 0.5,
      indicator: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      indicatorPadding: const EdgeInsets.all(5),
    );
  }
}