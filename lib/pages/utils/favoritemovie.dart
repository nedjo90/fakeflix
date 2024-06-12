import 'package:flutter/material.dart';
import 'package:movie_explorer/models/MovieDetailsModel.dart';
import 'package:movie_explorer/pages/utils/movielittlecard.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:movie_explorer/services/movie_service.dart';
import 'package:provider/provider.dart';

class FavoriteMovie extends StatefulWidget {
  const FavoriteMovie({super.key});

  @override
  State<FavoriteMovie> createState() => _FavoriteMovieState();
}

class _FavoriteMovieState extends State<FavoriteMovie> {
  List<MovieDetailsModel> list = [];

  Future<List<MovieDetailsModel>> _getMovies(BuildContext context) async {
    List<int> listId = Provider.of<MovieLikeProvider>(context).likedId;
    for (var id in listId) {
      dynamic response = await MovieService.getMovieById(id);
      MovieDetailsModel movie = MovieDetailsModel.fromJson(response.data);
      list.add(movie);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _getMovies(context),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieLittleCard(movie: list[index]);
              });
        });
  }
}
