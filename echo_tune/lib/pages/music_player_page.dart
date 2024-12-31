// ignore_for_file: library_private_types_in_public_api, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:echo_tune/dialogs/track_in_player_option_dialog.dart';
import 'package:echo_tune/model/track_model.dart';
import 'package:flutter/material.dart';

class MusicPlayerPage extends StatefulWidget {
  final TrackModel thisTrack;

  const MusicPlayerPage({super.key, required this.thisTrack});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayerPage> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    double _currentValue = 0.25;
    return Scaffold(
      backgroundColor: const Color(0xFFF7146F),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7146F),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              print('---- HIDE PLAYER BUTTON PRESSES ----');
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            iconSize: 48,
            color: Colors.black,
          ),
          // const SizedBox(width: 22),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            SizedBox(
              height: 360,
              child: Image.asset(
                widget.thisTrack.cover,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 22),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(0.3),
                thumbColor: Colors.white,
                trackHeight: 2.0,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 12.0),
              ),
              child: Slider(
                value: _currentValue,
                onChanged: (double value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('00:00'),
                Text('00:00'),
                // widget.thisTrack.duration
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                widget.thisTrack.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                widget.thisTrack.artists
                    .map((artist) => artist.name)
                    .join(', '),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 30, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      print('---- PLAY PREVIOUS IN QUEUE ----');
                    },
                    icon: const Icon(Icons.skip_previous_rounded),
                    iconSize: 66,
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        print('---- MUSIC PLAYER TOGGLED ----');
                        _isPlaying = !_isPlaying;
                      });
                    },
                    icon: Icon(
                      _isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                    ),
                    iconSize: 86,
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      print('---- PLAY NEXT IN QUEUE ----');
                    },
                    icon: const Icon(Icons.skip_next_rounded),
                    iconSize: 66,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    print('---- REPLAY CURRENT SONG ----');
                  },
                  icon: const Icon(Icons.replay),
                  iconSize: 46,
                  color: Colors.black87,
                ),
                IconButton(
                  onPressed: () {
                    print('---- SHOW SONGS QUEUE ----');
                  },
                  icon: const Icon(Icons.menu),
                  iconSize: 46,
                  color: Colors.black87,
                ),
                IconButton(
                  onPressed: () {
                    print('---- SHOW TRACK OPTIONS ----');
                    showDialog(
                      context: context,
                      builder: (context) => TrackInPlayerOptionDialog(
                          thisTrack: widget.thisTrack),
                    );
                  },
                  icon: const Icon(Icons.more_vert_rounded),
                  iconSize: 46,
                  color: Colors.black87,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
