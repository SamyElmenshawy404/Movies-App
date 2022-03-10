import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/SimilarResponse.dart';
import 'package:movies/model/TopRatedResponse.dart';

import '../../model/MovieDetails.dart';
import '../../model/pupular_response.dart';

class ApiManager {
  static const String apiKey = '7099f13be0ff703863e57b10982f58c3';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String popularMovies = 'movie/popular?';

  static Future<PopularResponse> fetchPopular() async {
    var params = {'apiKey': apiKey};
    // print("url1" + baseUrl + popularMovies);
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=7099f13be0ff703863e57b10982f58c3'));
    // print(test.body);
    // var url = Uri.https(baseUrl, popularMovies, params);
    // var response = await http.get(url);
    var popularResponse = PopularResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return popularResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<TopRatedResponse> fetchTopRated() async {
    // var params = {'apiKey': apiKey};
    // print("url1" + baseUrl + popularMovies);
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=7099f13be0ff703863e57b10982f58c3'));

    var topRatedResponse = TopRatedResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return topRatedResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<MovieDetails> getDetails(TopRated? topRated) async {
    String id = topRated!.id.toString();
    var params = {'apiKey': apiKey};
    var uri = Uri.parse('https://api.themoviedb.org/3/movie/' +
        id +
        '?api_key=7099f13be0ff703863e57b10982f58c3&');
    print('https://api.themoviedb.org/3/movie/' +
        id +
        '?api_key=7099f13be0ff703863e57b10982f58c3');
    final response = await http.get(uri);

    var moviesDetailsResponse =
        MovieDetails.fromJson(jsonDecode(response.body));
    print('in Details');
    if (response.statusCode == 200) {
      print('in Details');
      print(response.body);
      return moviesDetailsResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<SimilarResponse> getSimilarMovies(TopRated? topRated) async {
    String id = topRated!.id.toString();
    var uri = Uri.parse('https://api.themoviedb.org/3/movie/' +
        id +
        '/similar?api_key=7099f13be0ff703863e57b10982f58c3&');
    print('https://api.themoviedb.org/3/movie/' +
        id +
        '?api_key=7099f13be0ff703863e57b10982f58c3');
    final response = await http.get(uri);

    var similarResponse = SimilarResponse.fromJson(jsonDecode(response.body));
    print('in Details');
    if (response.statusCode == 200) {
      print('in Details');
      print(response.body);
      return similarResponse;
    }

    throw Exception('error loading movies ');
  }
}
