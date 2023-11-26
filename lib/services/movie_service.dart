import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nextion_taskpro/resources/utils/app_utils.dart';

import '../model/movie_model.dart';
import '../resources/app_constatns/app_constants.dart';

class MovieService {
  static Future<List<Movie>?> getMoviesList() async {
    try {
      List<Movie> moviesList = [];
      http.Response response =
          await http.get(Uri.parse(AppConstants.baseUrl), headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppConstants.barrierToken}',
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var movie in data["results"]) {
          moviesList.add(Movie.fromJson(movie));
        }
        return moviesList;
      } else {
        AppUtils.showSnackBar(
            title: "Error", message: "Error : ${response.statusCode}");
      }
    } catch (e) {
      AppUtils.showSnackBar(title: "Server Error", message: e.toString());
    }
    return [];
  }
}
