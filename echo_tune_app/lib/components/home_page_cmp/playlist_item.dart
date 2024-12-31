import 'package:echo_tune_app/model/playlist_model.dart';
import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final PlaylistModel thisPlaylist;

  const PlaylistItem({super.key, required this.thisPlaylist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print('---- ${thisPlaylist.name.toUpperCase()} CLICKED ----');
            Navigator.pushNamed(
              context,
              '/playlist',
              arguments: thisPlaylist,
            );
          },
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 100,
              maxWidth: double.infinity,
            ),
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              thisPlaylist.cover,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          thisPlaylist.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }
}
