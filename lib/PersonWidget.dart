import 'package:flutter/material.dart';
import 'StarWarsUniverse.dart';

class PersonWidget extends StatelessWidget {
  final StarWarsUniverse swu;
  PersonWidget({Key key, this.swu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
            child: new ListView.builder(
                itemCount: swu.person.length,
                itemBuilder: (context, index) {
                  return new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            title: new Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                  child: new Text(
                                    swu.person[index].name,
                                    style: TextStyle(
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  width: 150.0,
                                ),
                                //new Padding(padding: EdgeInsets.only(left: 45.0)),
                                new Container(
                                  child: new Text(
                                    swu.person[index].birthYear,
                                    style: TextStyle(
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  width: 70.0,
                                ),
                                new Container(
                                  child: new Text(
                                    swu.person[index].eyeColor,
                                    style: TextStyle(
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  width: 70.0,
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
