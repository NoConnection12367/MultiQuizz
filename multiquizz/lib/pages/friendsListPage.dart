import 'package:flutter/material.dart';
import '../classes/user.dart';
import 'package:firebase_database/firebase_database.dart';
import '../globals.dart' as globals;
import '../classes/game.dart';

class FriendsListPage extends StatefulWidget {

    FriendsListPage({Key key}) : super(key: key);

    @override
    _FriendsListPage createState() => _FriendsListPage();
}


class _FriendsListPage extends State<FriendsListPage> {

    List<String> friendslist = new List<String>();
    TextEditingController usernameController = new TextEditingController();

    _FriendsListPage(){
        getFriendsList(globals.activeUser.id);
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Statistics'),
            ),
            body:
            new ListView(
                children: <Widget>[
                    new Container(
                        padding: EdgeInsets.fromLTRB(35, 20, 0, 10),
                        child: Text("Friends:",
                                style: new TextStyle(fontSize: 20.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto"
                                ))
                    ),
                    new Container(
                        height: 300,
                        child: genFriendsListview(),
                    ),
                    new Container(
                        child: Text("Add Friend:",
                            style: TextStyle(
                                fontSize: 16,        
                            ),
                        ),
                    ),
                    new Container(
                        width: 500,
                        height: 40,
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                                new Container(
                                    width: 300,
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: new TextField(
                                        controller: usernameController,
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        autofocus: true | false,
                                    ),
                                ),
                                new Container(
                                    width: 45,
                                    height: 40,
                                    child: new ButtonTheme(
                                        height: 40,
                                        minWidth: 40,
                                        child: new RaisedButton(
                                            color: const Color(0xFF0099ed),
                                            child: new Text(
                                                "+",
                                                style: new TextStyle(fontSize:16.0,
                                                    color: const Color(0xFFffffff),
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Roboto"
                                                )
                                            ),
                                            onPressed: () {
                                                
                                            }
                                        ),
                                    ),
                                )
                            ],
                        ),
                    ),
                ]
            )
        );
    }
    
    static Future<List<String>> fromSnapshot(DataSnapshot snapshot) async {
        List<String> friendslist = new List<String>();
        List<int> friendslistIDs = new List<int>();

        List list = Game.tryConvertToList(snapshot.value);

        for(var item in list){
            if (item != null) {
                friendslistIDs.add(item['FriendID']);
            }
        }

        for(var id in friendslistIDs){
            User user = await User.getUser(id);

            friendslist.add(user.name);
        }   // nochmal checken wengen "FriendID"

        return friendslist;
    }

    // Get a game from the database via its id
    static Future<List<String>> getFutureFriendsList(int id) async {

        // Get user with given ID from database
        DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('FriendsList');
        DataSnapshot snapshot = await gameRef.reference().orderByChild('UserID').equalTo(id).once();

        return await fromSnapshot(snapshot);
    }

    void getFriendsList(int id) async {

        if (friendslist != null) {
            List<String> futureFriendslist = await getFutureFriendsList(id);

            setState(() {
                friendslist = futureFriendslist;
            });
        }
    }

    Widget genFriendsListview(){
        if (friendslist != null) {
            return new ListView.builder(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                itemCount: friendslist.length,
                itemBuilder: (BuildContext cntx, int index) {
                    return new Container(
                        height: 30,
                        child: ListTile(
                            title: Text(friendslist[index]),
                        ),
                    );
                },
            );
        } 
        else
            return new ListView();
    }
}
