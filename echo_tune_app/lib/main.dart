import 'package:echo_tune_app/model/artist_model.dart';
import 'package:echo_tune_app/model/playlist_model.dart';
import 'package:echo_tune_app/model/track_model.dart';
import 'package:echo_tune_app/pages/all_tracks_page.dart';
import 'package:echo_tune_app/pages/artist_page.dart';
import 'package:echo_tune_app/pages/fav_tracks_page.dart';
import 'package:echo_tune_app/pages/home_page.dart';
import 'package:echo_tune_app/pages/music_player_page.dart';
import 'package:echo_tune_app/pages/playlist_page.dart';
import 'package:echo_tune_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echo Tune Media Player',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/allTracks': (context) => AllTracksPage(),
        '/favTracks': (context) => FavTracksPage(),
        '/playlist': (context) => PlaylistPage(
              thisPlaylist:
                  ModalRoute.of(context)?.settings.arguments as PlaylistModel,
            ),
        '/artist': (context) => ArtistPage(
              thisArtist:
                  ModalRoute.of(context)?.settings.arguments as ArtistModel,
            ),
        '/settings': (context) => SettingsPage(),
        '/music_player': (context) => MusicPlayerPage(
              thisTrack:
                  ModalRoute.of(context)?.settings.arguments as TrackModel,
            ),
      },
    );
  }
}
