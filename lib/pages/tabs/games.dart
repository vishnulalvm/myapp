import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/services/functions/api_functions.dart';
import 'package:myapp/widgets/game_listview.dart';


class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  List _fullMovies = [];
  Timer? _debounce;
  String searchText = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _fullMovies = allMoviesList;
    searchController.addListener(onSearch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Search Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: onSearch(),
            controller: searchController,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            decoration: InputDecoration(
              suffixIcon: searchController.text.isEmpty
                  ? const Icon(
                      Icons.mic,
                      color: Colors.white,
                    )
                  : IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              fillColor: const Color.fromARGB(255, 141, 136, 136),
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: 'Search movies, show, tv...',
            ),
          ),
          Expanded(
            child:
                Curstom_list(searchText: searchText, fullMovies: _fullMovies),
          )
        ],
      ),
    );
  }

  onSearch() {
    setState(() {});
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchText != searchController.text) {
        setState(() {
          _fullMovies = allMoviesList
              .where((element) => element
                  .toString()
                  .toLowerCase()
                  .contains(searchController.text.toString().toLowerCase()))
              .toList();
        });
      }
      searchText = searchController.text;
    });
  }

  @override
  void dispose() {
    searchController.removeListener(onSearch);
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
