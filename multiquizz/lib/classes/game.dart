import 'package:firebase_database/firebase_database.dart';

import 'user.dart';
import 'question.dart';

class Game {
    int id;
    var startTime;
    var endTime;
    User creator;
    User opponent;
    List<User> memberList = new List<User> ();
    List<Question> questionList = new List<Question> ();

    Game();

    // Assemble game from a datasnapshot
    static Future<Game> fromSnapshot(DataSnapshot snapshot) async {
        var game = new Game();
        game.id = int.parse(snapshot.key);
        game.startTime = DateTime.parse(snapshot.value['StartDate']);
        game.endTime = DateTime.parse(snapshot.value['EndDate']);
        game.creator = await User.getUser(snapshot.value["CreatorID"]);
        game.opponent = await User.getUser(snapshot.value["OpponentID"]);

        game.memberList = new List<User>();
        game.memberList.add(game.creator);
        game.memberList.add(game.opponent);

        return game;
    }

    // Get a game from the database via its id
    static Future<Game> getGame(int id) async {

        // Get user with given ID from database
        DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('Game');

        DataSnapshot snapshot = await gameRef.reference().child(id.toString()).once();
        return await fromSnapshot(snapshot);
    }

    
}
