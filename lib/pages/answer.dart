import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kollywood_app/components/boardblock.dart';

class Answer extends StatefulWidget {
  final String lobbyCode;
  final Map<String, String> questionSet;
  Answer({Key key, @required this.lobbyCode, @required this.questionSet})
      : super(key: key);
  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  int mistakes = 3;
  String kollywoodString = "KOLLYWOOD";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(
          'TRY TO ANSWER',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send_sharp),
        backgroundColor: Colors.black87,
        onPressed: () {},
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            reverse: true,
            child: Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/bg.png'),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            margin: EdgeInsets.only(top: 130, bottom: 20),
                            color: Colors.grey[100].withOpacity(.6),
                            child: Text(
                              "Lobby: ${widget.lobbyCode}",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[850],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                BoardBlock(
                                  letter: widget.questionSet['hero']
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  label: 'HERO',
                                ),
                                BoardBlock(
                                  letter: widget.questionSet['heroine']
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  label: 'HEROINE',
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                BoardBlock(
                                  letter: widget.questionSet['movie']
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  label: 'MOVIE',
                                ),
                                BoardBlock(
                                  letter: widget.questionSet['song']
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  label: 'SONG',
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                // controller: _heroSuggestionController,
                                onChanged: (String value) {},
                                decoration: const InputDecoration(
                                  hintText: 'Enter Hero',
                                  labelText: 'Hero *',
                                ),
                              ),
                              TextFormField(
                                // controller: _heroineSuggestionController,
                                onChanged: (String value) {},
                                decoration: const InputDecoration(
                                  hintText: 'Enter Heroine',
                                  labelText: 'Heroine *',
                                ),
                              ),
                              TextFormField(
                                // controller: _movieSuggestionController,
                                onChanged: (String value) {},
                                decoration: const InputDecoration(
                                  hintText: 'Enter Movie',
                                  labelText: 'Movie *',
                                ),
                              ),
                              TextFormField(
                                // controller: _songSuggestionController,
                                onChanged: (String value) {},
                                decoration: const InputDecoration(
                                  hintText: 'Enter Song',
                                  labelText: 'Song *',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(9, (int index) {
                  var tileColor;
                  if (index >= mistakes) {
                    tileColor = Colors.green;
                  } else {
                    tileColor = Colors.red;
                  }
                  return Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(1.5),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      kollywoodString.substring(index, index + 1),
                      style: TextStyle(fontSize: 18, color: tileColor[500]),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: tileColor[100],
                        boxShadow: [
                          BoxShadow(
                            color: tileColor[300],
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ]),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
