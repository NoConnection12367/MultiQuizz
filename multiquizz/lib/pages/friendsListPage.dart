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

    _FriendsListPage(){
        getFriendsList(globals.activeUser.id);
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Statistics'),
            ),
            body: Container(
                child: genFriendsListview(),
            )
            
        );
    }
    
    static Future<List<String>> fromSnapshot(DataSnapshot snapshot) async {
        List<String> friendslist = new List<String>();
        List<int> friendslistIDs = new List<int>();

        List list = Game.tryConvertToList(snapshot.value);

        for(var item in list){
            friendslistIDs.add(item['FriendID']);
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

        List<String> futureFriendslist = await getFutureFriendsList(id);

        setState(() {
            friendslist = futureFriendslist;
        });
    }

    Widget genFriendsListview(){
        
        return new ListView.builder(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            itemCount: friendslist.length,
            itemBuilder: (BuildContext cntx, int index) {

                return new Container(
                    child: ListTile(
                        title: Text(friendslist[index]),
                    ),
                );
                
            },
        );
    }
}
