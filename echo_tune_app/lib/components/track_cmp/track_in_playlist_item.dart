import 'package:echo_tune_app/dialogs/track_in_playlist_option_dialog.dart';
import 'package:echo_tune_app/model/track_model.dart';
import 'package:flutter/material.dart';

class TrackInPlaylistItem extends StatelessWidget {
  final TrackModel thisTrack;

  const TrackInPlaylistItem({super.key, required this.thisTrack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  height: 70,
                  child: Image.asset(
                    thisTrack.cover,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thisTrack.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      thisTrack.artists.map((artist) => artist.name).join(', '),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) =>
                    TrackInPlaylistOptionDialog(thisTrack: thisTrack),
              );
            },
            child: const Icon(Icons.more_vert, size: 32),
          ),
        ],
      ),
    );
  }
}
