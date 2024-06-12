import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_explorer/api_config.dart';
import 'package:movie_explorer/models/moviepreviewmodel.dart';
import 'package:movie_explorer/pages/utils/addtofavoritebutton.dart';
import 'package:movie_explorer/provider/homepagepositionprovider.dart';
import 'package:provider/provider.dart';

class MoviePreviewCard extends StatefulWidget {
  final MoviePreviewModel movie;

  const MoviePreviewCard({super.key, required this.movie});

  @override
  State<MoviePreviewCard> createState() => _MoviePreviewCardState();
}

class _MoviePreviewCardState extends State<MoviePreviewCard> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePagePositionProvider>(
      builder: (BuildContext context, position,
          child) {
        return InkWell(
            onTap: () {
              setState(() {
                show = !show;
              });
            },
            child: Stack(alignment: Alignment.center, children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${ApiConfig.imageBaseUrl}${widget.movie.posterPath}',
              ),
              Visibility(
                  visible: show,
                  child: Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        color: Colors.black87,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.movie.title,
                              style: const TextStyle(
                                fontSize: 42,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            Text(widget.movie.overview,
                                maxLines: 4,
                                style: const TextStyle(
                                    height: 2,
                                    letterSpacing: 1.5,
                                    wordSpacing: 2,
                                    fontSize: 16,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis
                                )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AddToFavoriteButton(movieId: widget.movie.id),
                                IconButton(
                                    onPressed: () {
                                      context.go('/moviedetails/${widget.movie.id}',
                                          extra: {widget.movie.id, widget.movie.voteAverage});
                                    },
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                      size: 42,
                                    ))
                              ],
                            )
                          ],
                        ),
                      )))
            ]));
      },
    );
  }
}
