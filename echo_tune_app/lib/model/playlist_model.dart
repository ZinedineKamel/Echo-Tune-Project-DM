import 'package:echo_tune_app/model/track_model.dart';

class PlaylistModel  {
  final String name;
  final String cover;
  List<TrackModel> tracks;

  PlaylistModel({
    required this.name,
    this.cover = 'assets/playlist_cover.png',
    this.tracks = const [],
  });
}
