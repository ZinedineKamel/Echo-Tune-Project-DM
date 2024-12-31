import 'package:echo_tune/dialogs/track_option_dialog.dart';
import 'package:echo_tune/model/track_model.dart';
import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {
  final TrackModel thisTrack;

  const TrackItem({super.key, required this.thisTrack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFD9D9D9),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
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
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => TrackOptionDialog(thisTrack: thisTrack),
                );
              },
              child: const Icon(Icons.more_vert, size: 32),
            ),
          ],
        ),
      ),
    );
  }
}
