import 'People.dart';

class StarWarsUniverse {
  final int count;
  final String next;
  final String previous;
  final List<People> person;

  StarWarsUniverse({this.count, this.next, this.previous, this.person});

  factory StarWarsUniverse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<People> persons = list.map((i) => People.fromJson(i)).toList();

    return StarWarsUniverse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      person: persons,
    );
  }
}
