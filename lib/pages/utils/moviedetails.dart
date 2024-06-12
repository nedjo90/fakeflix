import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_explorer/models/moviedetailsmodel.dart';
import 'package:movie_explorer/pages/utils/moviedetailscard.dart';
import 'package:movie_explorer/services/movie_service.dart';

class MovieDetails extends StatefulWidget {
  final int id;

  const MovieDetails({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => MovieDetailsState();
}

class MovieDetailsState extends State<MovieDetails> {

  Future<MovieDetailsModel> _getMovie() async{
    dynamic response = await MovieService.getMovieById(widget.id);
    MovieDetailsModel movie = MovieDetailsModel.fromJson(response.data);
    return movie;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetailsModel>(
        future: _getMovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Center(child: Text('Connexion fail', style: TextStyle(color: Colors.white),));
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('An error occurred, please try later', style: TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
          } else {
            final movie = snapshot.data;
            return MovieDetailsCard(movie: movie);
          }
        });
  }
}
