import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/models/genre.dart';
import 'package:movie_explorer/models/moviedetailsmodel.dart';
import '../api_config.dart';
import '../models/moviepreviewmodel.dart';

import 'dart:developer' as developer;

class MovieService {
  static List<Genre>? listOfGenres = [];

  static Future<Response> readMovies(int pageNumber) async {
    final dio = Dio();
    final response = await dio.get(
        '${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}&page=$pageNumber');
    if (response.statusCode == 200) {
      return response;
    }
    else {
      throw Exception('Failed to fetch movies');
    }
  }

  static Future<Response> getMovieById(int movieId) async {
    final dio = Dio();

    final response = await dio.get(
        '${ApiConfig.baseUrl}/movie/$movieId?api_key=${ApiConfig.apiKey}');
    if (response.statusCode == 200) {
      return response;
    }
    else {
      throw Exception('Failed to fetch movie');
    }
  }

  static Future getAllGenres() async {
    final dio = Dio();

    final response = await dio.get(
        '${ApiConfig.baseUrl}/genre/movie/list?api_key=${ApiConfig.apiKey}');
    if (response.statusCode == 200) {
      var objJson = response.data['genres'] as List;
      listOfGenres = objJson.map((item) => Genre.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch genres');
    }
  }
}