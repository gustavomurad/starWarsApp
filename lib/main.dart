import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'StarWarsUniverse.dart';

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
              return new Column(
                children: <Widget>[
                  new Expanded(
                      child: new ListView.builder(
                          itemCount: snapshot.data.person.length,
                          itemBuilder: (context, index) {
                            return new Card(
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                      title: new Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                            child: new Text(
                                              snapshot.data.person[index].name,
                                              style: TextStyle(color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            width: 150.0,
                                          ),
                                          //new Padding(padding: EdgeInsets.only(left: 45.0)),
                                          new Container(
                                            child: new Text(
                                              snapshot.data.person[index].birthYear,
                                              style: TextStyle(color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            width: 70.0,
                                          ),
                                          new Container(
                                            child: new Text(
                                              snapshot.data.person[index].eyeColor,
                                              style: TextStyle(color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            width: 70.0,
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            );
                          }))
                ],
              );
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
