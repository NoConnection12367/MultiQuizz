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
    String addFriendResponse = "";

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
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text("Add Friend:",
                            style: TextStyle(
                                fontSize: 18,        
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
                                    padding: EdgeInsets.only(bottom: 30, left: 30, right: 10),
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
                                    width: 75,
                                    height: 40,
                                    padding: EdgeInsets.only(right: 30),
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
                                            onPressed: () async {
                                                bool isFriendAdded = false;
                                                bool isFriendExisting = true;
                                                int friendID = -1;

                                                List<User> allUsers = await User.getAllUsers();

                                                // prüfe, ob man bereits befreundet ist
                                                for(var friend in friendslist){
                                                    if(friend == usernameController.text){
                                                        isFriendAdded = true;
                                                        break;
                                                    }
                                                }

                                                if (isFriendAdded == false) {
                                                    // prüfe, ob der eingegebene User exisistiert
                                                    for(var user in allUsers){
                                                        if(user.name == usernameController.text){
                                                            isFriendExisting = true;
                                                            friendID = user.id;
                                                            break;
                                                        }

                                                        setState(() {
                                                            addFriendResponse = "User doesn't exist.";
                                                        });
                                                        
                                                        isFriendExisting = false;
                                                    }
                                                }
                                                else
                                                {
                                                    setState(() {
                                                        addFriendResponse = usernameController.text + " already has been added.";
                                                    });
                                                }

                                                if(isFriendAdded == false && isFriendExisting == true){
                                                    // Push new games data to the database
                                                    DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('FriendsList');

                                                    DataSnapshot snapshot = await gameRef.reference().once();
                                                    int numFriends = snapshot.value.length;

                                                    var newID = numFriends.toString();
                                                    // Add new games properties to the database
                                                    await gameRef.child(newID).child("UserID").set(globals.activeUser.id);
                                                    await gameRef.child(newID).child("FriendID").set(friendID);

                                                    setState(() {
                                                        addFriendResponse = usernameController.text + " has been added.";
                                                    });

                                                    getFriendsList(globals.activeUser.id);
                                                }
                                            }
                                        ),
                                    ),
                                )
                            ],
                        ),
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10, left: 30),
                        child: new Text(addFriendResponse),
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
