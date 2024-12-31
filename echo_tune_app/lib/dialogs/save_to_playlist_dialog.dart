import 'package:echo_tune_app/model/playlist_model.dart';
import 'package:flutter/material.dart';

class SaveToPlaylistDialog extends StatefulWidget {
  const SaveToPlaylistDialog({super.key});

  @override
  _SaveToPlaylistState createState() => _SaveToPlaylistState();
}

class _SaveToPlaylistState extends State<SaveToPlaylistDialog> {
  final List<PlaylistModel> playlists = [
    PlaylistModel(name: 'playlist 1', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 2', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 3', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 4', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 5', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 6', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 7', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 8', cover: 'assets/playlist_cover.png'),
    PlaylistModel(name: 'playlist 9', cover: 'assets/playlist_cover.png'),
  ];

  final List<bool> _checkboxValues = List.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFF2C2C2E),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 144,
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: playlists.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  title: Text(
                    playlists[index].name,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  value: _checkboxValues[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxValues[index] = value!;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('---- SAVE CHANGES ----');
                Navigator.pop(context);
              },
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
