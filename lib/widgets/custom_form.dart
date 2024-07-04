import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({super.key});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onChanged: onSearch(),
      // controller: searchController,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      decoration: const InputDecoration(
        suffixIcon: Icon(
          Icons.mic,
          color: Colors.white,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        fillColor: Color.fromARGB(255, 141, 136, 136),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintStyle: TextStyle(color: Colors.white),
        hintText: 'Search movies, show, tv...',
      ),
    );
  }
}
