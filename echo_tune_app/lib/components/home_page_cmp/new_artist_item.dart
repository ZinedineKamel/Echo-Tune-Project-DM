import 'package:echo_tune_app/dialogs/create_artist_dialog.dart';
import 'package:flutter/material.dart';

class NewArtistItem extends StatelessWidget {
  const NewArtistItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const CreateArtistDialog(),
            );
            print('---- CREATE NEW ARTIST ----');
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 4),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.add, size: 40, color: Colors.grey),
            ),
          ),
        ),
        const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Create Artist',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
