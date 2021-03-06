import 'package:flutter/material.dart';

class BoardBlock extends StatelessWidget {
  final String letter;
  final String label;
  BoardBlock({@required this.label, this.letter});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      width: 150.0,
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pink[300],
              Colors.pink[400],
            ]
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.pink.withOpacity(.5),
              offset: Offset(3.0, 3.0),
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            Text(
              letter,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ],
        )
      )
    );
  }
}
