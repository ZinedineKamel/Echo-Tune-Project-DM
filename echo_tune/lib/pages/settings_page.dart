// ignore_for_file: avoid_print

import 'package:echo_tune/components/music_player_bar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF524752),
      appBar: AppBar(
        backgroundColor: const Color(0xFF716575),
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 38),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      print('---- THEME CHANGING ----');
                    },
                    child: const Text(
                      'Theme',
                      style: TextStyle(color: Colors.white70, fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('---- ADDING LOCK ----');
                    },
                    child: const Text(
                      'Add Lock',
                      style: TextStyle(color: Colors.white70, fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('---- PERMISSION PAGE SHOULD APPEAR ----');
                    },
                    child: const Text(
                      'Device Storage Permission',
                      style: TextStyle(color: Colors.white70, fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('---- ALL DATA SHOULD BE CLEARED FROM HIVE ----');
                    },
                    child: const Text(
                      'Clear Current Data',
                      style: TextStyle(color: Colors.white70, fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('---- DISPLAY VERSION OF APP IN SNACKBAR ----');
                    },
                    child: const Text(
                      'Version 1.0',
                      style: TextStyle(color: Colors.white70, fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('---- EMAIL FOR SUPPORT, NO ACTION ----');
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Feedback: ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          '[email protected]',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const MusicPlayerBar(),
        ],
      ),
    );
  }
}
