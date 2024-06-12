import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final String? apiKey = dotenv.env['TMDB_API_KEY'];
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
}