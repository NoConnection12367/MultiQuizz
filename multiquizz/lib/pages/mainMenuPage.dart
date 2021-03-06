import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiquizz/pages/loginPage.dart';
import 'package:multiquizz/pages/startGameButtonPage.dart';
import 'package:multiquizz/pages/statisticsPage.dart';
import 'startNewGamePage.dart';
import 'gamePage.dart';
import '../classes/game.dart';
import '../classes/user.dart';
import 'friendsListPage.dart';

import '../globals.dart' as globals;

class MainMenuPage extends StatefulWidget {

    MainMenuPage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MainMenuPage createState() => _MainMenuPage();
}

class _MainMenuPage extends State<MainMenuPage> {

    List<Game> openGames = new List<Game>();
    List<Game> finishedGames = new List<Game>();

    _MainMenuPage() 
    {
        loadOpenGames();
        loadFinishedGames();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('MultiQuizz'),
                actions: <Widget> [
                    new RaisedButton(
                    color: const Color(0xFF0099ed),
                    child:
                        new Text(
                        "Reload",
                            style: new TextStyle(fontSize:16.0,
                            color: const Color(0xFFffffff),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto")
                        ),
                    onPressed: () {
                        loadOpenGames();
                        loadFinishedGames();
                    }
                ),
                new RaisedButton(
                    color: const Color(0xFF0099ed),
                    child:
                        new Text(
                        "Logout",
                            style: new TextStyle(fontSize:16.0,
                            color: const Color(0xFFffffff),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto")
                        ),
                    onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage(title: 'MultiQuizz')),
                            ModalRoute.withName('/logout'),
                        );
                    }
                ),
                ],
            ),
            body:
            new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    
                    new Container(
                        padding: EdgeInsets.fromLTRB(35, 20, 0, 10),
                        child: Text("Open Games:",
                                style: new TextStyle(fontSize: 20.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto"
                                ))
                    ),
                    new Expanded(
                        child: genOpenGamesListView(),
                    ),

                    new Container(
                        padding: EdgeInsets.fromLTRB(35, 0, 0, 10),
                        child: Text("Finished Games:",
                                style: new TextStyle(fontSize: 20.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto"
                                ))
                    ),
                    new Expanded(
                        child: genFinishedGamesListView(),
                    ),
                    new Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: new ButtonTheme(
                            height: 40,
                            minWidth: double.infinity,
                            child: new RaisedButton(
                                
                                color: const Color(0xFF0099ed),
                                child: new Text(
                                "Start new Game",
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
                    new Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                        child: new Row(
                            children: <Widget>[
                                new Expanded(
                                    child: new Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: new ButtonTheme(
                                            height: 40,
                                            minWidth: double.infinity,
                                            child: new RaisedButton(
                                                color: const Color(0xFF0099ed),
                                                child:
                                                    new Text(
                                                    "Statistics",
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
                                    ),
                                ),
                                new Expanded(
                                    child: new Container(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: new ButtonTheme(
                                            height: 40,
                                            minWidth: double.infinity,
                                            child: new RaisedButton(
                                                color: const Color(0xFF0099ed),
                                                child:
                                                    new Text(
                                                    "Friendslist",
                                                        style: new TextStyle(fontSize:16.0,
                                                        color: const Color(0xFFffffff),
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "Roboto")
                                                    ),
                                                onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => FriendsListPage()),
                                                    );
                                                }
                                            ),
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),

                ]
            ),
        );
    }

    Widget genOpenGamesListView()
    {

        return new ListView.builder(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
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

                return new Container(
                    decoration: new BoxDecoration (
                        gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.2, 0.8],
                            colors: [
                                // Colors are easy thanks to Flutter's Colors class.
                                Color.fromARGB(255, 240, 240, 240),
                                Color.fromARGB(255, 220, 220, 220)
                            ],
                        ),
                    ),
                    child: ListTile(
                        
                        title: Text(new DateFormat.yMMMd().format(openGames[index].startTime)),
                        subtitle: Text(memberNames),
                        onTap: () => Navigator.push(
                            cntx,
                            MaterialPageRoute(builder: (cntx) => StartGameButtonPage(game: openGames[index])),
                        ),
                    ),
                );
                
            },
        );
    }

    Widget genFinishedGamesListView()
    {
        return new ListView.builder(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
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
                
                return new Container(
                    decoration: new BoxDecoration (
                        gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.2, 0.8],
                            colors: [
                                // Colors are easy thanks to Flutter's Colors class.
                                Color.fromARGB(255, 240, 240, 240),
                                Color.fromARGB(255, 220, 220, 220)
                            ],
                        ),
                    ),
                    child: ListTile(
                        title: Text(new DateFormat.yMMMd().format(finishedGames[index].startTime)),
                        subtitle: Text(memberNames),
                        onTap: () => Navigator.push(
                            cntx,
                            MaterialPageRoute(builder: (cntx) => GamePage(finishedGames[index])),
                        )
                    ),
                );
            },
        );
    }

    void loadOpenGames() async
    {
        List<Game> games = await Game.getOpenGamesFromUser(globals.activeUser.id);

        setState(() {
            openGames = games;
        });
    }

    void loadFinishedGames() async
    {
        List<Game> games = await Game.getFinishedGamesFromUser(globals.activeUser.id);

        setState(() {
            finishedGames = games;
        });
    }
}
