import 'package:movieapp_20091/model/Media.dart';
import 'package:movieapp_20091/common/HttpHandler.dart';
import 'dart:async';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
}

class MediaPrvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShow(category: category);
  }
}
