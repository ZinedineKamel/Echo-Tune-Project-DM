import 'package:echo_tune_app/model/artist_model.dart';
import 'package:echo_tune_app/model/track_model.dart';
import 'package:flutter/material.dart';

class MusicPlayerBar extends StatefulWidget {
  const MusicPlayerBar({super.key});

  @override
  _MusicPlayerBarState createState() => _MusicPlayerBarState();
}

class _MusicPlayerBarState extends State<MusicPlayerBar> {
  bool isPlaying = false;

  TrackModel trackPlaying = TrackModel(
    name: 'myTrack is the best track of the world',
    artists: [ArtistModel(name: 'KSI'), ArtistModel(name: 'Yeat')],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('---- MUSIC PLAYER BAR CLICKED ----');
        Navigator.pushNamed(
          context,
          '/music_player',
          arguments: trackPlaying,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        padding: const EdgeInsets.only(left: 16.0, right: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 100,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    trackPlaying.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    trackPlaying.artists
                        .map((artist) => artist.name)
                        .join(', '),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  print('---- MUSIC PLAYLER TOGGLED  ----');
                  isPlaying = !isPlaying;
                });
              },
              iconSize: 42,
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
