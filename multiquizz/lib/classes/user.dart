import 'package:firebase_database/firebase_database.dart';

class User {
    int id;
    var name;
    var pwHash;
    int score;

    User(int id, String name, String password, int score)
    {
        // db-Aufruf - fill member
        this.name = name;
        this.id = id;
        this.pwHash = password;
        this.score = score;
    }

    User.fromSnapshot(DataSnapshot snapshot) {
        this.id = int.parse(snapshot.key);
        this.name = snapshot.value["Username"];
        this.pwHash = snapshot.value["PwHash"];
        this.score = snapshot.value["Score"];
    }

    User.fromMap(Map<dynamic, dynamic> map) {
        this.id = map["ID"];
        this.name = map["Username"];
        this.pwHash = map["PwHash"];
        this.score = map["Score"];
    }

    static Future<User> getUser(int id) async {

        // Get user with given ID from database
        DatabaseReference userRef = FirebaseDatabase.instance.reference().child('User');

        DataSnapshot snapshot = await userRef.reference().child(id.toString()).once();
        return new User.fromSnapshot(snapshot);
    }

    static Future<List<User>> getAllUsers() async {

        DatabaseReference userRef = FirebaseDatabase.instance.reference().child('User');

        DataSnapshot snapshot = await userRef.reference().once();

        List<dynamic> users = snapshot.value;
        List<User> userList = new List<User>();
        
        for (var u in users) {
            if (u != null) {
                userList.add(new User.fromMap(u));
            }
        }

        return userList;
    }

}