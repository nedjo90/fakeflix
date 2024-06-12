import 'package:movie_explorer/models/moviepreviewmodel.dart';

class MoviePreviewPageModel {
  final int page;
  final List<MoviePreviewModel> listOfMovies;
  final int totalPages;
  final int totalResults;

  MoviePreviewPageModel(
      {required this.page,
      required this.listOfMovies,
      required this.totalPages,
      required this.totalResults});

  factory MoviePreviewPageModel.fromJson(dynamic json) {
    final List<dynamic> results = json['results'];
    // print(results);
    List<MoviePreviewModel> list =
        results.map((movie) => MoviePreviewModel.fromJson(movie)).toList();
    return MoviePreviewPageModel(
        page: json['page'],
        listOfMovies: list,
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }
}
