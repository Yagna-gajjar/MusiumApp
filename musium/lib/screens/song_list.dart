import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SongList extends StatefulWidget {
  const SongList({super.key});

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllSongs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.network(snapshot.data![index]['photo'].toString(), fit: BoxFit.cover,),
                              ),
                              Text(snapshot.data![index]['title'].toString())
                        ])),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(
                child: Text("No user Found"),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List> getAllSongs() async {
    var response = await http.get(Uri.parse("http://localhost:5000/AllSongs"));
    return jsonDecode(response.body);
  }
}
