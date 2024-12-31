// ignore_for_file: avoid_print

import 'package:echo_tune/components/music_player_bar.dart';
import 'package:echo_tune/components/track_cmp/track_item.dart';
import 'package:echo_tune/model/artist_model.dart';
import 'package:echo_tune/model/track_model.dart';
import 'package:flutter/material.dart';

class AllTracksPage extends StatelessWidget {
  AllTracksPage({super.key});

  final List<TrackModel> tracks = [
    TrackModel(name: 'Track1', artists: [ArtistModel(name: 'Artist1')]),
    TrackModel(name: 'Track2', artists: [ArtistModel(name: 'Artist3')]),
    TrackModel(name: 'Track3', artists: [ArtistModel(name: 'Artist2')]),
    TrackModel(name: 'Track4', artists: [
      ArtistModel(name: 'Artist1'),
      ArtistModel(name: 'Artist2'),
    ]),
    TrackModel(name: 'Track5', artists: [
      ArtistModel(name: 'Artist6'),
      ArtistModel(name: 'Artist1'),
      ArtistModel(name: 'Artist2'),
      ArtistModel(name: 'Artist4'),
    ]),
    TrackModel(name: 'Track6', artists: [
      ArtistModel(name: 'Artist7'),
      ArtistModel(name: 'Artist1'),
    ]),
    TrackModel(name: 'Track7', artists: [
      ArtistModel(name: 'Artist5'),
      ArtistModel(name: 'Artist2'),
    ]),
    TrackModel(name: 'Track8', artists: [
      ArtistModel(name: 'Artist2'),
      ArtistModel(name: 'Artist1'),
    ]),
    TrackModel(name: 'Track9', artists: [
      ArtistModel(name: 'Artist4'),
      ArtistModel(name: 'Artist2'),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF524752),
      appBar: AppBar(
        backgroundColor: const Color(0xFF716575),
        title: const Text(
          'All Tracks',
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
