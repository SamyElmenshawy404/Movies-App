import 'dart:convert';

import 'package:movies/model/TopRatedResponse.dart';
import 'package:movies/model/latest_response.dart';

import 'model/pupular_response.dart';

import 'package:http/http.dart' as http;

class ApiManager {
  static const String apiKey = '7099f13be0ff703863e57b10982f58c3';

  // static const String baseUrl = 'httpapi.themoviedb.org';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String popularMovies = 'movie/popular?';

  static Future<PopularResponse> fetchPopular() async {
    var params = {'apiKey': apiKey};
    // print("url1" + baseUrl + popularMovies);
    final test = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=7099f13be0ff703863e57b10982f58c3'));
    // print(test.body);
    // var url = Uri.https(baseUrl, popularMovies, params);
    // var response = await http.get(url);
    var popularResponse = PopularResponse.fromJson(jsonDecode(test.body));
    if (test.statusCode == 200) {
      print(test.body);
      return popularResponse;
    }

    throw Exception('error loading movies ');
  }

  // static Future<LatestResponse> fetchLatest() async {
  //   // var params = {'apiKey': apiKey};
  //   // print("url1" + baseUrl + popularMovies);
  //   final test = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/latest?api_key=7099f13be0ff703863e57b10982f58c3'));
  //   // print(test.body);
  //   // var url = Uri.https(baseUrl, popularMovies, params);
  //   // var response = await http.get(url);
  //   var latestResponse = LatestResponse.fromJson(jsonDecode(test.body));
  //   if (test.statusCode == 200) {
  //     print(test.body);
  //     return latestResponse;
  //   }
  //
  //   throw Exception('error loading movies ');
  // }
  static Future<TopRatedResponse> fetchTopRated() async {
    // var params = {'apiKey': apiKey};
    // print("url1" + baseUrl + popularMovies);
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=7099f13be0ff703863e57b10982f58c3'));

    // print(test.body);
    // var url = Uri.https(baseUrl, popularMovies, params);
    // var response = await http.get(url);
    var topRatedResponse = TopRatedResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print(response.body);

      return topRatedResponse;
    }

    throw Exception('error loading movies ');
  }
}
