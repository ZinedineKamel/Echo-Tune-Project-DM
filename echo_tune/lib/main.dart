import 'package:echo_tune/model/artist_model.dart';
import 'package:echo_tune/model/playlist_model.dart';
import 'package:echo_tune/model/track_model.dart';
import 'package:echo_tune/pages/all_tracks_page.dart';
import 'package:echo_tune/pages/artist_page.dart';
import 'package:echo_tune/pages/fav_tracks_page.dart';
import 'package:echo_tune/pages/home_page.dart';
import 'package:echo_tune/pages/music_player_page.dart';
import 'package:echo_tune/pages/playlist_page.dart';
import 'package:echo_tune/pages/settings_page.dart';
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
