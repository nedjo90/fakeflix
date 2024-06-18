import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/pages/utils/movielittlecard.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:provider/provider.dart';

class FavoriteMovie extends StatefulWidget {
  const FavoriteMovie({super.key});

  @override
  State<FavoriteMovie> createState() => _FavoriteMovieState();
}

class _FavoriteMovieState extends State<FavoriteMovie> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieLikeProvider>(context, listen: false).getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieLikeProvider>(
        builder: (context, movieLikeProvider, child) {
      return ListView.builder(
          itemCount: movieLikeProvider.list.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieLittleCard(movie: movieLikeProvider.list[index]);
          });
    });
  }
}
