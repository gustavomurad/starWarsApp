import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'StarWarsUniverse.dart';
import 'PersonWidget.dart';

Future<StarWarsUniverse> fetchPost() async {
  final response =
      await http.get('https://swapi.co/api/people/?format=json&page=1');

  if (response.statusCode == 200) {
    return StarWarsUniverse.fromJson(json.decode(response.body));
  } else {
    throw Exception("Error retrieving data from Death Star!");
  }
}

class StarWars extends StatefulWidget {
  @override
  StarWarsState createState() => new StarWarsState();
}

class StarWarsState extends State<StarWars> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars Universe'),
      ),
      body: new FutureBuilder<StarWarsUniverse>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return RefreshIndicator(
                  child: PersonWidget(swu: snapshot.data),
                  onRefresh: fetchPost);
            }
            return new Container(
              alignment: AlignmentDirectional.center,
              child: new CircularProgressIndicator(),
            );
          }),
    );
  }
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Universe Stats',
      home: StarWars(),
    );
  }
}
