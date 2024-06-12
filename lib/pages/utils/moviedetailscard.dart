import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:movie_explorer/api_config.dart';
import 'package:movie_explorer/models/moviedetailsmodel.dart';
import 'package:movie_explorer/pages/utils/addtofavoritebutton.dart';

const TextStyle regularTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    height: 1.5,
    wordSpacing: 1.5,
    letterSpacing: 2);

class MovieDetailsCard extends StatelessWidget {
  final MovieDetailsModel? movie;

  const MovieDetailsCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: '${ApiConfig.imageBaseUrl}${movie!.posterPath}',
                  height: 200,
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                    child: Column(
                  children: [
                    Text(
                      movie!.title ?? 'Unavailable',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AddToFavoriteButton(movieId: movie!.id)
                  ],
                ))
              ],
            ),
          ),
          const FractionallySizedBox(
            widthFactor: 0.7,
            child: Divider(
              color: Colors.red,
              thickness: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Wrap(
              spacing: 8.0, // Space between the Chips horizontally
              runSpacing: 4.0,
              children: [
                ...movie!.genres.map((genre) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(
                      label: Text(genre.name),
                    ),
                  );
                })
              ],
            ),
          ),
          Text(
            movie!.tagLine ?? 'Unavailable',
            textAlign: TextAlign.center,
            style: const TextStyle(
                shadows: [Shadow(color: Colors.white, offset: Offset(0, -5))],
                color: Colors.transparent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                overflow: TextOverflow.visible,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationThickness: 0.5,
                letterSpacing: 2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(movie!.overview ?? 'Unavailable overview',
                textAlign: TextAlign.justify, style: regularTextStyle),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  'Release date: ${movie!.releaseDate ?? 'Unavailable overview'}',
                  textAlign: TextAlign.left,
                  style: regularTextStyle),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  'Country: ${movie!.originCountry ?? 'Unavailable country'}',
                  textAlign: TextAlign.left,
                  style: regularTextStyle),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  'Budget:\t${MoneyFormatter(amount: movie!.budget.toDouble()).output.symbolOnLeft ?? 'Unavailable budget'}',
                  textAlign: TextAlign.left,
                  style: regularTextStyle),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  'Revenue:\t${MoneyFormatter(amount: movie!.revenue.toDouble()).output.symbolOnLeft ?? 'Unavailable budget'}',
                  textAlign: TextAlign.left,
                  style: regularTextStyle),
            ),
          )
        ],
      ),
    );
  }
}
