import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Movie {
  bool? adult;
  RxBool? isFav=false.obs;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie({this.adult,
    this.isFav,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    // genreIds = json['genre_ids'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

Map<String,dynamic>toJson(Movie movie){
    return {
      'id':id,
      'adult':adult,'backdrop_path':backdropPath,
      'genre_ids':genreIds,
      'original_language':originalLanguage,'original_title':originalTitle,
      'overview':overview,
      'popularity':popularity,
      'poster_path':posterPath,
      'release_date':releaseDate,
      'title':title,
      'video':video,
      'vote_average':voteAverage,
      'vote_count':voteCount,
    };
}
}