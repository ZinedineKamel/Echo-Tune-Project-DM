// ignore_for_file: avoid_print

import 'package:echo_tune/components/music_player_bar.dart';
import 'package:echo_tune/components/track_cmp/track_item.dart';
import 'package:echo_tune/model/artist_model.dart';
import 'package:echo_tune/model/track_model.dart';
import 'package:flutter/material.dart';

class FavTracksPage extends StatelessWidget {
  FavTracksPage({super.key});

  final List<TrackModel> tracks = [
    TrackModel(
      name: 'Track 1',
      artists: [ArtistModel(name: 'Artist 1')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 2',
      artists: [ArtistModel(name: 'Artist 2')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 3',
      artists: [ArtistModel(name: 'Artist 2')],
      isFav: true,
    ),
    TrackModel(name: 'Track 4', artists: [
      ArtistModel(name: 'Artist 1'),
      ArtistModel(name: 'Artist 2')
    ]),
    TrackModel(
      name: 'Track 5',
      artists: [ArtistModel(name: 'Artist 4')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 6',
      artists: [ArtistModel(name: 'Artist 2')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 7',
      artists: [ArtistModel(name: 'Artist 1'), ArtistModel(name: 'Artist 3')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 8',
      artists: [ArtistModel(name: 'Artist 1'), ArtistModel(name: 'Artist 7')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 9',
      artists: [ArtistModel(name: 'Artist 2'), ArtistModel(name: 'Artist 1')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 10',
      artists: [ArtistModel(name: 'Artist 5'), ArtistModel(name: 'Artist 2')],
      isFav: true,
    ),
    TrackModel(
      name: 'Track 11',
      artists: [
        ArtistModel(name: 'Artist 1'),
        ArtistModel(name: 'Artist 7'),
        ArtistModel(name: 'Artist 3'),
        ArtistModel(name: 'Artist 4')
      ],
      isFav: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF524752),
      appBar: AppBar(
        backgroundColor: const Color(0xFF716575),
        title: const Text(
          'Favourites',
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                return TrackItem(
                  thisTrack: tracks[index],
                );
              },
            ),
          ),
          const MusicPlayerBar(),
        ],
      ),
    );
  }
}
