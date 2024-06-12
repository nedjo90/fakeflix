import 'package:flutter/material.dart';
import 'package:movie_explorer/models/moviepreviewmodel.dart';
import 'package:movie_explorer/pages/utils/custombottomnavbar.dart';
import 'package:movie_explorer/pages/utils/moviedetails.dart';
import 'package:movie_explorer/pages/utils/moviedetailsnavbar.dart';

class MovieDetailsPage extends StatelessWidget{
  final int id;

  const MovieDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: const MovieDetailsNavBar(),
      ),
      body: MovieDetails(id: id),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

}