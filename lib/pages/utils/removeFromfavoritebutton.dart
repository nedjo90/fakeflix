import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/models/moviepreviewmodel.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:provider/provider.dart';

class RemoveFromFavoriteButton extends StatelessWidget {
  final int movieId;
  final User? user = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;

  RemoveFromFavoriteButton({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieLikeProvider>(
      builder: (context, movieLikeProvider, child) {
        return IconButton(
          onPressed: () async {
            movieLikeProvider.removeLikeId(movieId);

          },
          icon: const Icon(
            Icons.remove,
            color: Colors.white,
            size: 42,
          ),
        );
      },
    );
  }
}
