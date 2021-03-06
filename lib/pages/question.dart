import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kollywood_app/components/boardblock.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Question extends StatefulWidget {
  final String lobbyCode;
  Question({Key key, @required this.lobbyCode}) : super(key: key);
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Map questionSet = {};
  final items = List.generate(
    100,
    (i) => '$i',
  );
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(
          'SET THE QUESTION',
          style: TextStyle(color: Colors.white54),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[600],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    "Lobby: ${widget.lobbyCode}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.pink[800],
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
                        letter: 'A',
                        label: 'HERO',
                      ),
                      BoardBlock(
                        letter: 'B',
                        label: 'HEROINE',
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      BoardBlock(
                        letter: 'C',
                        label: 'MOVIE',
                      ),
                      BoardBlock(
                        letter: 'D',
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
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontStyle: FontStyle.italic),
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          controller: this._typeAheadController,
                        ),
                        suggestionsCallback: (pattern) {
                          return items;
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text = suggestion;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Hero',
                          hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black87.withOpacity(.5)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter Heroine',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black87.withOpacity(.5))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter Movie',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black87.withOpacity(.5))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter Song',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black87.withOpacity(.5))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
