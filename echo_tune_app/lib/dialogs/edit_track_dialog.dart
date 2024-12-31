// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';

class EditTrackDialog extends StatefulWidget {
  const EditTrackDialog({super.key});

  @override
  _EditTrackState createState() => _EditTrackState();
}

class _EditTrackState extends State<EditTrackDialog> {
  final List<Map<String, dynamic>> artists = [
    {'artist': 'Artist 1', 'selected': true},
    {'artist': 'Artist 2', 'selected': true},
    {'artist': 'Artist 3', 'selected': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFF2C2C2E),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  print('---- PHOTO SHOULD BE TAKEN ----');
                },
                child: const Row(
                  children: [
                    Icon(Icons.camera_alt, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Take Photo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  print('---- SHOULD BROWSE FOR PHOTO ----');
                },
                child: const Row(
                  children: [
                    Icon(Icons.photo_library, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Browse Image',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Track Name',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: artists.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            artists[index]['artist'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(
                              () {
                                artists[index]['selected'] =
                                    !artists[index]['selected'];
                              },
                            );
                          },
                          icon: Icon(
                            artists[index]['selected']
                                ? Icons.add_circle_outline_rounded
                                : Icons.remove_circle_outline_rounded,
                            color: artists[index]['selected']
                                ? Colors.blue
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
      ),
    );
  }
}
