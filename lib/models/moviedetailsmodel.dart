import 'package:movie_explorer/models/genre.dart';
import 'package:movie_explorer/models/productioncompaniemodel.dart';
import 'package:movie_explorer/services/movie_service.dart';

class MovieDetailsModel {
  final int id;
  final bool adult;
  final String backdropPath;
  final int budget;
  final String homePage;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int revenue;
  final String tagLine;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final List<Genre> genres;
  final List<ProductionCompanyModel> productionCompanies;

  MovieDetailsModel(
      {required this.id,
      required this.adult,
      required this.backdropPath,
      required this.budget,
      required this.homePage,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.revenue,
      required this.tagLine,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required this.genres,
      required this.productionCompanies
      });

  factory MovieDetailsModel.fromJson(dynamic json) {
    var listOfCountryOrigin = List<String>.from(json['origin_country']);
    List<Genre> listOfGenres = [];
    var jsonListGenre = json['genres'] as List;
    for (var g in jsonListGenre) {
      listOfGenres.add(Genre.fromJson(g));
    }
    var jsonListProdComp = json['production_companies'];
    List<ProductionCompanyModel> listOfProductionCompanies = [];
    for (var p in jsonListProdComp)
      {
        listOfProductionCompanies.add(ProductionCompanyModel.fromJson(p));
      }
    return MovieDetailsModel(
        id: json['id'],
        adult: json['adult'] ?? true,
        backdropPath: json['backdrop_path'] ?? 'Unavailable backdrop path',
        budget: json['budget'] ?? 0,
        homePage: json['homepage'] ?? 'Unavailable homepage',
        originCountry: listOfCountryOrigin,
        originalLanguage: json['original_language'] ?? 'Unavailable original language',
        originalTitle: json['original_title'] ?? 'Unavailable original title',
        overview: json['overview'] ?? 'Unavailable overview',
        posterPath: json['poster_path'] ?? 'Unavailable poster path',
        releaseDate: json['release_date'] ?? 'Unavailable release date',
        revenue: json['revenue'] ?? 0,
        tagLine: json['tagline'] ?? 'Unavailable tagline',
        title: json['title'] ?? 'Unavailable title',
        video: json['video'] ?? false,
        voteAverage: json['vote_average'] ?? 0.0,
        voteCount: json['vote_count'] ?? 0,
        genres: listOfGenres,
        productionCompanies: listOfProductionCompanies
    );
  }
}
