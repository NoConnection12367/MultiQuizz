import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multiquizz/classes/game.dart';
import 'package:multiquizz/classes/user.dart';
import 'package:multiquizz/pages/questionPage.dart';
import 'package:multiquizz/pages/startGameButtonPage.dart';
import '../globals.dart' as globals;


class StartNewGamePage extends StatefulWidget {
  StartNewGamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartNewGamePage createState() => _StartNewGamePage();
}

class _StartNewGamePage extends State<StartNewGamePage> {

    List<User> _friendsList = new List<User>();

    _StartNewGamePage() {
        refreshFriendsList();
    }

    @override
    Widget build(BuildContext context) {

        print("Starting to build startNewGame page..");
        
        return new Scaffold(
            appBar: new AppBar(
              title: new Text('Create new game'),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                        padding: const EdgeInsets.all(20.0),
                        child: new ButtonTheme(
                            padding: const EdgeInsets.all(30.0),
                            minWidth: double.infinity,
                            child: RaisedButton(
                                padding: const EdgeInsets.all(8.0),
                                textColor: Colors.white,
                                color: Colors.blue,
                                onPressed: initNewRandomGame,
                                child: new Text("Random Player"),
                            ),
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(25.0, 20.0, 20.0, 5.0),
                        child: new Text(
                            "Your Friends:", 
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                    ),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                            child: genFriendsList(),
                            ),
                        )
                ]
            ),

        );
    }

    Widget genFriendsList() {

        return new ListView.builder(
            itemCount: _friendsList.length,
            itemBuilder: (BuildContext cntx, int index) {

                return new Container (
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
                        title: Text(
                            _friendsList[index].name,
                            style: TextStyle(
                                fontSize: 17
                                ),
                            ),
                        onTap: () { 
                            initNewGame(_friendsList[index].id);
                        },
                    ),
                );
            },
        );
    }

    void refreshFriendsList() async {
        List<User> userNames = await User.getAllUsers();

        setState(() {
            _friendsList = userNames;
        });
    }

    void initNewGame(int opponentID) async {

        // Launch startNewGameButton page, push opponentID as parameter
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StartGameButtonPage(opponentID: opponentID)),
        );
    }

    void initNewRandomGame() async {

        final _random = new Random();
        List<User> userList = await User.getAllUsers();

        int randomUserID = -1;
        do {
            randomUserID = userList[_random.nextInt(userList.length)].id;
        }
        while (randomUserID == globals.activeUser.id);

        initNewGame(randomUserID);
    }
}
