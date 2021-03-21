import 'package:flutter/material.dart';
import 'package:kollywood_app/pages/answer.dart';
import 'package:kollywood_app/pages/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Answer(
              lobbyCode: 'AAAAAA',
              questionSet: {
                'hero':'vijay',
                'heroine':'malavika',
                'movie':'master',
                'song':'andha kanna',
              },
            )
      },
    );
  }
}
