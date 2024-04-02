import 'package:flickflix/source/network/network.dart';

class MovieRepository {
  final Network? network;

  MovieRepository({required this.network});

  Future nowPlaying(page) async {
    var json = await network!.nowPlaying(page);
    return json;
  }

  Future popular(page) async {
    var json = await network!.popular(page);
    return json;
  }

  Future upcoming(page) async {
    var json = await network!.upcoming(page);
    return json;
  }

  Future genre() async {
    var json = await network!.genre();
    return json;
  }

  Future detailMovie(movieId) async {
    var json = await network!.detailMovie(movieId);
    return json;
  }
  Future detailMovieVideo(movieId) async {
    var json = await network!.detailMovieVideo(movieId);
    return json;
  }

  Future tranding() async {
    var json = await network!.tranding();
    return json;
  }
}
