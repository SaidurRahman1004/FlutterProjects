import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({super.key});

  @override
  State<PhotoGalleryApp> createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  List PhotosAll = [];

  Future<void> fetchPhotos() async {
    final response = await http.get(
      Uri.parse("https://picsum.photos/v2/list"),

    );
    if (response.statusCode == 200) {
      setState(() {
        PhotosAll = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  @override
  void initState() {
    fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Gallery'), centerTitle: true),
      body: GridView.builder(
        itemCount: 50,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,

        ),
        itemBuilder: (_, index) {
          final photoAccess = PhotosAll[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRect(
                   child: Image.network(
                     photoAccess['download_url'],
                     fit: BoxFit.cover,
                     width: double.infinity,
                   ),

                ),
                ),
                
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    photoAccess['author'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),

                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
