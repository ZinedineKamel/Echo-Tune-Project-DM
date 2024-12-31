// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:echo_tune/components/music_player_bar.dart';
import 'package:echo_tune/components/track_cmp/track_in_artist_item.dart';
import 'package:echo_tune/dialogs/edit_artist_dialog.dart';
import 'package:echo_tune/model/artist_model.dart';
import 'package:echo_tune/model/track_model.dart';
import 'package:flutter/material.dart';

class ArtistPage extends StatefulWidget {
  final ArtistModel thisArtist;

  const ArtistPage({super.key, required this.thisArtist});

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  final FocusNode _focusNode = FocusNode();
  late List<TrackModel> tracks = [];

  @override
  void initState() {
    super.initState();
    tracks = [
      TrackModel(
        name: 'Track 1',
        artists: [widget.thisArtist, ArtistModel(name: 'Artist 3')],
      ),
      TrackModel(
        name: 'Track 2',
        artists: [widget.thisArtist, ArtistModel(name: 'Artist 4')],
      ),
      TrackModel(name: 'Track 3', artists: [widget.thisArtist]),
      TrackModel(name: 'Track 4', artists: [widget.thisArtist]),
      TrackModel(name: 'Track 5', artists: [widget.thisArtist]),
      TrackModel(
        name: 'Track 6',
        artists: [widget.thisArtist, ArtistModel(name: 'Artist 2')],
      ),
      TrackModel(
        name: 'Track 7',
        artists: [widget.thisArtist, ArtistModel(name: 'Artist 2')],
      ),
    ];
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    constraints: const BoxConstraints(
                      maxHeight: 150,
                      maxWidth: 150,
                    ),
                    height: 150,
                    child: Image.asset(
                      widget.thisArtist.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 206,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 0),
                        Text(
                          widget.thisArtist.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                print('---- PLAY ARTIST SONGS ----');
                              },
                              color: Colors.black87,
                              iconSize: 34,
                              icon: const Icon(
                                  Icons.play_circle_outline_outlined),
                            ),
                            IconButton(
                              onPressed: () {
                                print('---- SHUFFLE ARTIST SONGS ----');
                              },
                              color: Colors.black87,
                              iconSize: 34,
                              icon: const Icon(Icons.shuffle_rounded),
                            ),
                            IconButton(
                              onPressed: () {
                                print('---- EDIT ARTIST ----');
                                showDialog(
                                  context: context,
                                  builder: (context) => EditArtistDialog(
                                    thisArtist: widget.thisArtist,
                                  ),
                                );
                              },
                              color: Colors.black54,
                              iconSize: 34,
                              icon: const Icon(Icons.edit_square),
                            ),
                            IconButton(
                              onPressed: () {
                                print('---- REMOVE ARTIST ----');
                              },
                              color: Colors.black54,
                              iconSize: 34,
                              icon: const Icon(
                                  Icons.remove_circle_outline_outlined),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 108),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: const Color(0xFFD9D9D9),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 6),
                child: TextField(
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tracks.length,
                itemBuilder: (context, index) {
                  return TrackInArtistItem(thisTrack: tracks[index]);
                },
              ),
            ),
            const MusicPlayerBar(),
          ],
        ),
      ),
    );
  }
}
