
import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Netflix',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SingleChildScrollView(
        child: CustomProfile(),
      ),
    );
  }
}
