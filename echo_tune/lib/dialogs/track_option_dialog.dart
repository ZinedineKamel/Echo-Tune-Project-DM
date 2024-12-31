// ignore_for_file: avoid_print

import 'package:echo_tune/dialogs/edit_track_dialog.dart';
import 'package:echo_tune/dialogs/save_to_playlist_dialog.dart';
import 'package:echo_tune/model/track_model.dart';
import 'package:flutter/material.dart';

class TrackOptionDialog extends StatelessWidget {
  final TrackModel thisTrack;

  const TrackOptionDialog({super.key, required this.thisTrack});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFF2C2C2E),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                print('---- SHOULD SAVE TO PLAYLIST ----');
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => const SaveToPlaylistDialog(),
                );
              },
              child: const Text(
                'Save To Playlist',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(height: 26),
            GestureDetector(
              onTap: () {
                print('---- SHOULD BE PLAYED NEXT ----');
                Navigator.pop(context);
              },
              child: const Text(
                'Play Next',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(height: 26),
            GestureDetector(
              onTap: () {
                print('---- EDIT TRACK DIALOG ----');
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => const EditTrackDialog(),
                );
              },
              child: const Text(
                'Edit Track',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(height: 26),
            GestureDetector(
              onTap: () {
                print('---- SHOULD BE ADDED TO FAVOURITES ----');
                thisTrack.isFav = !thisTrack.isFav;
                Navigator.pop(context);
              },
              child: Text(
                (thisTrack.isFav)
                    ? 'Remove From Favourites'
                    : 'Add To Favourites',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}