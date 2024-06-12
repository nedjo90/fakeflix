import 'package:flutter/widgets.dart';
import 'package:movie_explorer/models/moviepreviewmodel.dart';

class PopularMovieProvider extends ChangeNotifier{
  late List<MoviePreviewModel> _listOfMovie;

  PopularMovieProvider(Future<List<MoviePreviewModel>> readMovies);

  List<MoviePreviewModel> get listOfMovie => _listOfMovie;
  set listOfMovie (List<MoviePreviewModel> listOfMovie) {
    _listOfMovie = listOfMovie;
    notifyListeners();
  }
}