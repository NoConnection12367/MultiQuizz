import 'package:flutter/material.dart';
import 'startNewGamePage.dart';

class MainMenuPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
            title: new Text('MultiQuizz'),
            ),
            body:
            new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            new RaisedButton(
                                color: const Color(0xFF0099ed),
                                child:
                                new Text(
                                "New Game",
                                    style: new TextStyle(fontSize:16.0,
                                    color: const Color(0xFFffffff),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto")
                                ),
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StartNewGamePage()),
                                    );
                                }
                            ),

                            new RaisedButton(
                                color: const Color(0xFF0099ed),
                                child:
                                new Text(
                                "+ Friends",
                                    style: new TextStyle(fontSize:16.0,
                                    color: const Color(0xFFffffff),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto")
                                ),
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StartNewGamePage()),
                                    );
                                }
                            )
                        ]
                    ),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            new Text(
                            "Games",
                                style: new TextStyle(fontSize:22.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto")
                            )
                        ]

                    ),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            genOpenGamesListView(),
                        ]
                    ),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        new RaisedButton(
                            color: const Color(0xFF0099ed),
                            child:
                                new Text(
                                "Stats",
                                    style: new TextStyle(fontSize:16.0,
                                    color: const Color(0xFFffffff),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto")
                                ),
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StartNewGamePage()),
                                    );
                                }
                            )
                        ]
                    )
                ]
            ),
        );
    }

    Widget genOpenGamesListView(){
        // db-Entries aller offenen Spiele mit Namen der Spieler
        
        List<Game> Games = new List<Game> ();

        for()
        {

        }

        return new ListView(
            children: <Widget>[
                ListTile(
                    leading: Icon(Icons.map),
                    title: Text('Map'),
                ),
                ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Album'),
                ),
                ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                )
            ],
        );
    }

}