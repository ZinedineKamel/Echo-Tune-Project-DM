import 'package:echo_tune_app/components/home_page_cmp/artist_item.dart';
import 'package:echo_tune_app/components/music_player_bar.dart';
import 'package:echo_tune_app/components/home_page_cmp/new_artist_item.dart';
import 'package:echo_tune_app/components/home_page_cmp/new_playlist_item.dart';
import 'package:echo_tune_app/components/home_page_cmp/playlist_item.dart';
import 'package:echo_tune_app/model/artist_model.dart';
import 'package:echo_tune_app/model/playlist_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<PlaylistModel> playlists = [
    PlaylistModel(name: 'playlist 1', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 2', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 3', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 4', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 5', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 6', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 7', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 8', cover: 'assets/playlist_cover.png'),
  ];

  final List<ArtistModel> artists = [
    ArtistModel(name: 'artist 1', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 2', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 3', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 4', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 5', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 6', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 7', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 8', image: 'assets/artist_cover.png'),
    ArtistModel(name: 'artist 9', image: 'assets/artist_cover.png'),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF524752),
      appBar: AppBar(
        backgroundColor: const Color(0xFF716575),
        title: const Text(
          'EchoTune',
          style: TextStyle(fontSize: 38),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('---- Settings ----');
              Navigator.pushNamed(context, '/settings');
            },
            iconSize: 38,
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _buildSection(
                    'All Tracks',
                    () {
                      Navigator.pushNamed(context, '/allTracks');
                    },
                  ),
                  _buildSection(
                    'Favourite Tracks',
                    () {
                      Navigator.pushNamed(context, '/favTracks');
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 15.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'All Playlists',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 135,
                    ),
                    itemCount: playlists.length + 1,
                    itemBuilder: (context, index) {
                      if (index == playlists.length) {
                        return const NewPlaylistItem();
                      }
                      return PlaylistItem(
                        thisPlaylist: playlists[index],
                      );
                    },
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'All Artists',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 110,
                    ),
                    itemCount: artists.length + 1,
                    itemBuilder: (context, index) {
                      if (index == artists.length) {
                        return const NewArtistItem();
                      }
                      return ArtistItem(
                        thisArtist: artists[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const MusicPlayerBar(),
        ],
      ),
    );
  }
}

Widget _buildSection(String title, VoidCallback action) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28, color: Colors.white70),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: action,
            icon: const Icon(
              Icons.navigate_next_outlined,
              color: Colors.white70,
              size: 32,
            ),
          ),
        ),
      ],
    ),
  );
}
