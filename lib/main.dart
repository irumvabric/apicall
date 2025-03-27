import 'package:apicall_2/screens/random_user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // initialRoute: '/gallery',
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/gallery': (context) => const GalleryScreen(),
      //   '/picture': (context) => const PictureScreen(),
      // },
      home: const GalleryScreen(),
    );
  }
}
