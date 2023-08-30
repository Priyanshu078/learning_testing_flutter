import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(json) {
    return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }
}

class FetchAlbum extends StatefulWidget {
  const FetchAlbum({super.key});

  @override
  State<FetchAlbum> createState() => _FetchAlbumState();
}

Future<Album> fetchAlbum(http.Client http) async {
  var response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class _FetchAlbumState extends State<FetchAlbum> {
  late final Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              Text(snapshot.error.toString());
            }

            return const CircularProgressIndicator();
          }),
    );
  }
}
