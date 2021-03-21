import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kollywood_app/components/boardblock.dart';
import 'package:kollywood_app/pages/answer.dart';
// import 'package:kollywood_app/components/suggestions.dart';

class Question extends StatefulWidget {
  final String lobbyCode;
  Question({Key key, @required this.lobbyCode}) : super(key: key);
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var _movieSuggestionController = TextEditingController();
  var _heroSuggestionController = TextEditingController();
  var _heroineSuggestionController = TextEditingController();
  var _songSuggestionController = TextEditingController();

  Map<String, String> questionSet = {
    'hero': '',
    'heroine': '',
    'movie': '',
    'song': '',
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(
          'SET THE QUESTION',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send_sharp),
        backgroundColor: Colors.black87,
        onPressed: () {
          if (questionSet['hero'].length > 1 &&
              questionSet['heroine'].length > 1 &&
              questionSet['movie'].length > 1 &&
              questionSet['song'].length > 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Answer(
                  lobbyCode: widget.lobbyCode,
                  questionSet: questionSet,
                ),
              ),
            );
          } else {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Question Set not provided properly'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Provide suitable texts for the question.'),
                        Text('Close this dialog box.')
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
      body: SingleChildScrollView(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              letter: questionSet['hero'].length >= 1
                                  ? questionSet['hero']
                                      .substring(0, 1)
                                      .toUpperCase()
                                  : 'NaN',
                              label: 'HERO',
                            ),
                            BoardBlock(
                              letter: questionSet['heroine'].length >= 1
                                  ? questionSet['heroine']
                                      .substring(0, 1)
                                      .toUpperCase()
                                  : 'NaN',
                              label: 'HEROINE',
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            BoardBlock(
                              letter: questionSet['movie'].length >= 1
                                  ? questionSet['movie']
                                      .substring(0, 1)
                                      .toUpperCase()
                                  : 'NaN',
                              label: 'MOVIE',
                            ),
                            BoardBlock(
                              letter: questionSet['song'].length >= 1
                                  ? questionSet['song']
                                      .substring(0, 1)
                                      .toUpperCase()
                                  : 'NaN',
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
                        children: [
                          TextFormField(
                            controller: _heroSuggestionController,
                            onChanged: (String value) {
                              setState(() {
                                questionSet['hero'] = value.toLowerCase();
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Hero',
                              labelText: 'Hero *',
                            ),
                          ),
                          TextFormField(
                            controller: _heroineSuggestionController,
                            onChanged: (String value) {
                              setState(() {
                                questionSet['heroine'] = value.toLowerCase();
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Heroine',
                              labelText: 'Heroine *',
                            ),
                          ),
                          TextFormField(
                            controller: _movieSuggestionController,
                            onChanged: (String value) {
                              setState(() {
                                questionSet['movie'] = value.toLowerCase();
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Movie',
                              labelText: 'Movie *',
                            ),
                          ),
                          TextFormField(
                            controller: _songSuggestionController,
                            onChanged: (String value) {
                              setState(() {
                                questionSet['song'] = value.toLowerCase();
                              });
                            },
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
    );
  }
}
