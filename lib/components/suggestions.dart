import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieSuggestion {
  final String name;
  final int year;
  final String image;

  MovieSuggestion({this.name, this.year, this.image});

  factory MovieSuggestion.fromJson(Map<String, dynamic> json) {
    if (json['id'].startsWith('tt')) {
      return MovieSuggestion(
        name: json['l'],
        year: json['y'],
        image: json['i'][0],
      );
    } else {
      return MovieSuggestion();
    }
  }
}

class ActorSuggestion {
  final String name;
  final String desc;
  final String image;

  ActorSuggestion({this.name, this.desc, this.image});

  factory ActorSuggestion.fromJson(Map<String, dynamic> json) {
    if (json['id'].startsWith('nm')) {
      return ActorSuggestion(
        name: json['l'],
        desc: json['s'],
        image: json['i'][0],
      );
    } else {
      return null;
    }
  }
}

Future fetchMovie({String query: 'a'}) async {
  final String firstLetter = query.substring(0, 1);
  List<MovieSuggestion> list;
  http.Response response = await http.get(
      Uri.https('sg.media-imdb.com', '/suggests/$firstLetter/$query.json'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
  if (response.statusCode == 200) {
    final String responseBody = filterJson(body: response.body);
    final responseData = jsonDecode(responseBody);
    var body = responseData['d'] as List;
    list = body
        .map<MovieSuggestion>((json) => MovieSuggestion.fromJson(json))
        .toList();
  }
  return list;
}

String filterJson({String body}) {
  int brackOne = body.indexOf('(');
  int brackLast = body.length;
  return body.substring(brackOne + 1, brackLast - 1);
}
