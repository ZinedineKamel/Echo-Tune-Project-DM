import 'package:echo_tune_app/model/artist_model.dart';
import 'package:flutter/material.dart';

class ArtistItem extends StatelessWidget {
  final ArtistModel thisArtist;

  const ArtistItem({super.key, required this.thisArtist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print('---- ${thisArtist.name.toUpperCase()} CLICKED ----');
            Navigator.pushNamed(
              context,
              '/artist',
              arguments: thisArtist,
            );
          },
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 150,
              maxWidth: double.infinity,
            ),
            height: 80,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              thisArtist.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          thisArtist.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}
