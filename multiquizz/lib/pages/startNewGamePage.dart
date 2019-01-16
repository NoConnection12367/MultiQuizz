import 'package:flutter/material.dart';

class StartNewGamePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text('MultiQuizz'),
            ),
            body: Container(
              child: Text("Neues Spiel"),
            ),

        );
    }
    // QuestionPage(GameID)
}
