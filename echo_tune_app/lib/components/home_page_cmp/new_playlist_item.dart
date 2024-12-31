import 'package:echo_tune_app/dialogs/create_playlist_dialog.dart';
import 'package:flutter/material.dart';

class NewPlaylistItem extends StatelessWidget {
  const NewPlaylistItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => const CreatePlaylistDialog());
            print('---- CREATE NEW PLAYLIST ----');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(Icons.add, size: 40, color: Colors.grey),
              ),
            ),
          ),
        ),
        const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Create Playlist',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
