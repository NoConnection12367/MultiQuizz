import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'startNewGamePage.dart';
import 'gamePage.dart';
import 'statisticsPage.dart';
import '../classes/game.dart';
import '../classes/user.dart';
import 'questionPage.dart';

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
            ),
            body:
            new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    
                    Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                        child: new ButtonTheme(
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
                        padding: EdgeInsets.fromLTRB(35, 0, 0, 10),
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

                    new Center(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: new ButtonTheme(
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
                                        initQuestionPage(context);
                                        
                                    }
                                ),
                            ),
                        ),
                    )

                ]
            ),
        );
    }

    void initQuestionPage(context) async
    {
        Game game = await Game.getGame(1);

        Navigator.push(
            context,
            //MaterialPageRoute(builder: (context) => StatisticsPage()),
            MaterialPageRoute(builder: (context) => QuestionPage(game: game, questionID: 0, correctAnswerCount: 0)),

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
                            MaterialPageRoute(builder: (cntx) => QuestionPage(game: openGames[index], questionID: 0, correctAnswerCount: 0)),
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
                            MaterialPageRoute(builder: (cntx) => GamePage(finishedGames[index].id)),
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
