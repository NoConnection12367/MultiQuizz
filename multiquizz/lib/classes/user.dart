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
        this.name = snapshot.value["Name"];
        this.pwHash = snapshot.value["PwHash"];
        this.score = snapshot.value["Score"];
    }

    static Future<User> getUser(int id) async {

        // Get user with given ID from database
        DatabaseReference userRef = FirebaseDatabase.instance.reference().child('User');

        DataSnapshot snapshot = await userRef.reference().child(id.toString()).once();
        return new User.fromSnapshot(snapshot);
    }

}