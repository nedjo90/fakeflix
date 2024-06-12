import 'package:flutter/material.dart';
import 'package:movie_explorer/pages/utils/custombottomnavbar.dart';
import 'package:movie_explorer/pages/utils/moviepreview.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Color homeColor = Colors.white;
  Color favColor = Colors.white;
  Color userColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'FakeFlix ',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child:
                          const Icon(Icons.search, size: 40, color: Colors.red))
                ],
              ),
            )),
        // ignore: prefer_const_constructors
        body: MoviePreview(),
        bottomNavigationBar: const CustomBottomNavBar());
  }
}
