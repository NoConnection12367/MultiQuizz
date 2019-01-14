import 'package:cloud_firestore/cloud_firestore.dart';

class User {
    var id;
    var name;
    var pwHash;
    var score;

    User(int id, String name, String password, int score)
    {
        // db-Aufruf - fill member
        this.name = name;
        this.id = id;
        this.pwHash = password;
        this.score = score;
    }

    static Future<User> getUser(int id) async {

        // Get user with given ID from database
        CollectionReference ref = Firestore.instance.collection('user');
        QuerySnapshot eventsQuery = await ref
            .where("ID", isEqualTo: id)
            .getDocuments();

        eventsQuery.documents.forEach((document) {
            return new User(document["ID"], document["Name"], document["Password"], document["Score"]);
        });

        return null;
    }
}