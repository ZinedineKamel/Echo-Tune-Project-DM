import 'package:echo_tune_app/model/artist_model.dart';

class TrackModel {
  final String name;
  final String cover;
  final String? path;
  bool isFav;
  final List<ArtistModel> artists;

  TrackModel({
    required this.name,
    this.cover = 'assets/track_cover.png',
    this.path,
    this.isFav = false,
    this.artists = const [],
  });
}
