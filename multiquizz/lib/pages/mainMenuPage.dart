import 'package:flutter/material.dart';
import 'startNewGamePage.dart';
import '../classes/game.dart';
import '../classes/user.dart';

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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            new Expanded(
                                child: genOpenGamesListView()
                            ),
                        ],
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
        List<Game> openGames = new List<Game>(); // später: get games from db
        openGames.add(new Game());

        ListView listView = new ListView();

        for(Game game in openGames)
        {
            // für jedes game -> adde ein listtile            
            List<String> memberNames = new List<String>();

            for(User member in game.memberList)
            {
                memberNames.add(member.name);
            }

            listView = ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                    return new ListTile(
                        title: Text(memberNames[index])
                    );
                },
                itemCount: memberNames.length,
            );
        }

        return listView;
    }
}
