import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/movie_model.dart';

class SharedPrefService {
  storeFavList(String key, List<Movie> value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value.isEmpty) {
      return;
    }
    final List<String> serializedList =
        value.map((movie) => jsonEncode(movie.toJson(movie))).toList();
    await sharedPreferences.setStringList(key, serializedList);
    var d = await sharedPreferences.getStringList('fav');
  }

  Future<List<Movie>> getFavList(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var serializedList = sharedPreferences.getStringList(key);
    if (serializedList != null) {
      return serializedList.map((String jsonString) {
        final Map<String, dynamic> map = jsonDecode(jsonString);
        return Movie.fromJson(map);
      }).toList();
    }
    return [];
  }
}

List<Movie> decode(String movies) => (json.decode(movies) as List<dynamic>)
    .map((item) => Movie.fromJson(item))
    .toList();

String encode(movies) => json.encode(
      movies.map((item) => Movie().toJson(item)).toList(),
    );
