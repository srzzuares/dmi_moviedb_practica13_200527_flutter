// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'dart:convert'; // Importa la biblioteca para codificar y decodificar JSON.
import 'package:movieapp_20091/common/Util.dart'; // Importa la clase Media desde un archivo llamado Media.dart.
import 'package:movieapp_20091/common/MediaProvider.dart'; // Importa la clase Media desde un archivo llamado Media.dart.

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);

  int getRelaseYear() {
    if (releaseDate == null || releaseDate == "") {
      return 0;
    }
    return DateTime.parse(releaseDate).year;
  }

  factory Media(Map jsonMap, MediaType mediaType) {
    try {
      return new Media.deserialize(jsonMap, mediaType);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserialize(Map json, MediaType mediaType)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title =  json[mediaType == MediaType.movie ?
        "title" : "name"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json[mediaType == MediaType.movie ?
        "release_date" : "first_air_date"],
        genreIds = json["genre_ids"].toList();
}

enum MediaType {movie, show}
