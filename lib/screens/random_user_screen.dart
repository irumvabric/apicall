import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String? title;
  String? email;
  String? imageUrl;
  bool isLoading = false;
  List<dynamic> photos = [];

  // Fetch random user data
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
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galery")),
      body: Center(
        child:
            isLoading
                ? const CircularProgressIndicator()
                : title != null
                ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    final photo = photos[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(photo["url"]!),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          photo["title"]!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          photo["url"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              "/picture",
                              arguments: photo["id"],
                            );
                          },
                          child: const Text("See the picture"),
                        ),
                      ],
                    );
                  },
                )
                : const Text("Failed to load picture"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          fetchPhotos();
        },
      ),
    );
  }
}
