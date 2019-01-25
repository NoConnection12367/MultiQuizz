import 'package:flutter/material.dart';
import 'package:multiquizz/classes/game.dart';

class GamePage extends StatelessWidget {

    final Game game;

    GamePage(this.game);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Games'),
            ),
            body: 
            Center(
                child: Column(
                    children: <Widget>[ 
                    ]
                )
            ),
        );
    }
}