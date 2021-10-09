class MovieResponse {
  final String backdropPath;
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  MovieResponse(
      {required this.backdropPath,
      required this.id,
      required this.title,
      required this.posterPath,
      required this.overview});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"],
        overview: json["overview"]);
  }
}
