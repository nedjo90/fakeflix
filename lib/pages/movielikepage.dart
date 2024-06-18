import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/pages/utils/custombottomnavbar.dart';
import 'package:movie_explorer/pages/utils/favoritemovie.dart';
import 'package:movie_explorer/pages/utils/movielittlecard.dart';

class MovieLikePage extends StatelessWidget{

  const MovieLikePage({super.key});

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
        body: FavoriteMovie(),
        bottomNavigationBar: const CustomBottomNavBar());
  }
}