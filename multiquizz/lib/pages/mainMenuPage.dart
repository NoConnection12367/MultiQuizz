import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'startNewGamePage.dart';
import 'gamePage.dart';
import 'statisticsPage.dart';
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
                    
                    new Center(
                        child: Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: new RaisedButton(
                                color: const Color(0xFF0099ed),
                                child:
                                new Text(
                                "+ New Game",
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
                        ),
                    ),     
/*
                            new IconButton(
                                color: const Color(0xFF0099ed),
                                icon: Icon(const IconData(0xe0ba, fontFamily: 'MaterialIcons')),
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StartNewGamePage()),
                                    );
                                }
                            )*/
                    new Container(
                        padding: EdgeInsets.only(top: 20.0, left: 15.0),
                        child: Text("Offene Spiele",
                                style: new TextStyle(fontSize: 20.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"
                                ))
                    ),
                    new Expanded(
                        child: genOpenGamesListView(),
                    ),

                    new Container(
                        padding: EdgeInsets.only(top: 20.0, left: 15.0),
                        child: Text("Beendete Spiele",
                                style: new TextStyle(fontSize: 20.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"
                                ))
                    ),
                    new Expanded(
                        child: genFinishedGamesListView(),
                    ),

                    new Center(
                        child: Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: new RaisedButton(
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
                                        MaterialPageRoute(builder: (context) => StatisticsPage()),
                                    );
                                }
                            ),
                        ),
                    )

                ]
            ),
        );
    }

    Widget genOpenGamesListView(){

        // db-Entries aller offenen Spiele mit Namen der Spieler
        List<Game> openGames = new List<Game>();
        openGames.add(new Game());                  // später: get games from db

        return new ListView.builder(
            itemCount: openGames.length,
            itemBuilder: (BuildContext cntx, int index) {

                String memberNames = '';

                for(User member in openGames[index].memberList)
                {
                    if (memberNames == '') {
                      memberNames = member.name;
                    }
                    else
                        memberNames = memberNames + ', ' + member.name;
                }

                return new ListTile(
                    title: Text(new DateFormat.yMMMd().format(new DateTime.now()).toString()),
                    subtitle: Text(memberNames),
                    onTap: () => Navigator.push(
                        cntx,
                        MaterialPageRoute(builder: (cntx) => GamePage(openGames[index].id)),
                )
                );
            },
        );
    }

    Widget genFinishedGamesListView(){

        // db-Entries aller offenen Spiele mit Namen der Spieler
        List<Game> finishedGames = new List<Game>();
        finishedGames.add(new Game());                  // später: get games from db

        return new ListView.builder(
            itemCount: finishedGames.length,
            itemBuilder: (BuildContext cntx, int index) {

                String memberNames = '';

                for(User member in finishedGames[index].memberList)
                {
                    if (memberNames == '') {
                      memberNames = member.name;
                    }
                    else
                        memberNames = memberNames + ', ' + member.name;
                }
                
                return new ListTile(
                    title: Text(new DateFormat.yMMMd().format(new DateTime.now()).toString()),
                    subtitle: Text(memberNames),
                    onTap: () => Navigator.push(
                        cntx,
                        MaterialPageRoute(builder: (cntx) => GamePage(finishedGames[index].id)),
                )
                );
            },
        );
    }
}
