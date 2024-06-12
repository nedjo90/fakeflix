import 'package:movie_explorer/models/genre.dart';
import 'package:movie_explorer/services/movie_service.dart';

class MoviePreviewModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String? releaseDate;
  final String? originalLanguage;
  final String? originalTitle;
  final double? voteCount;
  final List<Genre> listOfGenre;

  MoviePreviewModel({required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.listOfGenre,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.voteCount,
  });

  factory MoviePreviewModel.fromJson(Map<String, dynamic> json){
    var list = json['genre_ids'] as List;
    List<Genre> listOfGenres = [];
    for(var i in list)
      {
        Genre? genre = MovieService.listOfGenres?.singleWhere((item) => item.id == i);
        if (genre != null)
          {
            listOfGenres.add(Genre(genre.id, genre.name));
          }
      }
    return MoviePreviewModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json["release_date"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      voteCount: json["vote_count"].toDouble(),
      listOfGenre: listOfGenres
    );
  }
}
