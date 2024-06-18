import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_explorer/api_config.dart';
import 'package:movie_explorer/models/MovieDetailsModel.dart';
import 'package:movie_explorer/pages/utils/addtofavoritebutton.dart';
import 'package:movie_explorer/pages/utils/removeFromfavoritebutton.dart';

class MovieLittleCard extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieLittleCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            context.go('/moviedetails/${movie.id}',);
          },
          child: CachedNetworkImage(
            imageUrl: '${ApiConfig.imageBaseUrl}${movie.posterPath}',
            height: 200,
          ),
        ),
        Flexible(
            child: Column(
              children: [
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RemoveFromFavoriteButton(movieId: movie.id)
                  ],
                )
              ],
            ))
      ],
    );
  }
  
}