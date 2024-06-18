import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:provider/provider.dart';

class AddToFavoriteButton extends StatelessWidget {
  final int movieId;


  const AddToFavoriteButton({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Provider.of<MovieLikeProvider>(context, listen: false)
            .addLikedId(movieId);
      },
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 42,
      ),
    );
  }
}
