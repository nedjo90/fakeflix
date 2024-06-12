import 'package:flutter/material.dart';
import 'package:movie_explorer/models/moviepreviewmodel.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:provider/provider.dart';

class RemoveFromFavoriteButton extends StatelessWidget{
  final int movieId;
  const RemoveFromFavoriteButton({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<MovieLikeProvider>(context, listen: false).removeLikeId(movieId);
        },
        icon: const Icon(
          Icons.remove,
          color: Colors.white,
          size: 42,
        ),
    );
  }

}