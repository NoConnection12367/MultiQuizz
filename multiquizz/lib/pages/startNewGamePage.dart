import 'package:flutter/material.dart';
import 'package:multiquizz/classes/user.dart';


class StartNewGamePage extends StatefulWidget {
  StartNewGamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartNewGamePage createState() => _StartNewGamePage();
}

class _StartNewGamePage extends State<StartNewGamePage> {

    List<User> _friendsList = new List<User>();

    @override
    Widget build(BuildContext context) {

        refreshFriendsList();

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
                        onTap: () => initNewGame(),
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

    void initNewGame() {

    }

    void initNewRandomGame() {

    }
}
