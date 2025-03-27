import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PictureScreen extends StatefulWidget {
  const PictureScreen({super.key});

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  bool? isLoading;
  List<dynamic> photos = [];

  Future<void> fetchPhotos() async {
    setState(() => isLoading = true);

    try {
      final response = await Dio().get(
        "https://jsonplaceholder.typicode.com/photos",
      );
      photos = response.data;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPhotos(); // Load a user on startup
  }

  @override
  Widget build(BuildContext context) {
    final int number = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(title: const Text("Picture Screen")),
      body: Column(
        children: [
          const Text("Picture Screen"),
          const SizedBox(height: 30),
          Text(photos[number]['title'].toString()),
          const SizedBox(height: 30), // Add this line
          Image.network(photos[number]['url'].toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchPhotos(); // Load a user on startup
        }, // Load a user on startup
      ),
    );
  }
}
