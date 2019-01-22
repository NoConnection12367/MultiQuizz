import 'dart:math';

import 'package:firebase_database/firebase_database.dart';

import 'user.dart';
import 'question.dart';
import '../globals.dart' as globals;

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
        // Init properties
        var game = new Game();
        game.id = int.parse(snapshot.key);
        game.startTime = DateTime.parse(snapshot.value['StartDate']);
        game.endTime = DateTime.parse(snapshot.value['EndDate']);
        game.creator = await User.getUser(snapshot.value["CreatorID"]);
        game.opponent = await User.getUser(snapshot.value["OpponentID"]);

        // Get members
        game.memberList = new List<User>();
        game.memberList.add(game.creator);
        game.memberList.add(game.opponent);

        // Get question list
        game.questionList.add(await Question.getQuestion(snapshot.value["Q1"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q2"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q3"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q4"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q5"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q6"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q7"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q8"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q9"]));
        game.questionList.add(await Question.getQuestion(snapshot.value["Q10"]));

        return game;
    }

    // Get a game from the database via its id
    static Future<Game> getGame(int id) async {

        // Get user with given ID from database
        DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('Game');

        DataSnapshot snapshot = await gameRef.reference().child(id.toString()).once();
        return await fromSnapshot(snapshot);
    }

    static Future<List<Game>> getOpenGamesFromUser(int userID) async {

        DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('Game');
        dynamic snapshot = await gameRef.orderByChild('OpponentID').equalTo(userID).once();

        List<Game> games = new List<Game>();

        List vals = snapshot.value;

        for (var val in vals) {

            if (val != null && val["IsFinished"] == "false")
            {
                Game game = await Game.getGame(val["ID"]);
                games.add(game);
            }
        }

        return games;
    }

    static Future<List<Game>> getFinishedGamesFromUser(int userID) async {

        DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('Game');
        dynamic snapshot = await gameRef.orderByChild('OpponentID').equalTo(userID).once();

        List<Game> games = new List<Game>();

        List vals = snapshot.value;

        for (var val in vals) {

            if (val != null && val["IsFinished"] == "true")
            {
                Game game = await Game.getGame(val["ID"]);
                games.add(game);
            }
        }

        return games;
    }

    static Future<Game> createNewGame(int opponent) async {
        
        // Push new games data to the database
        DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('Game');

        DataSnapshot snapshot = await gameRef.reference().once();
        int numGames = snapshot.value.length;

        var newID = numGames.toString();
        // Add new games properties to the database
        gameRef.child(newID).child("CreatorID").set(globals.activeUser.id);
        gameRef.child(newID).child("OpponentID").set(opponent);
        gameRef.child(newID).child("IsFinished").set("false");
        gameRef.child(newID).child("StartDate").set(DateTime.now().toString());
        gameRef.child(newID).child("EndDate").set(DateTime.now().add(Duration(days: 7)).toString());

        // Generate random questions for the new game
        var rnd = new Random();
        gameRef.child(newID).child("Q1").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q2").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q3").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q4").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q5").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q6").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q7").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q8").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q9").set(rnd.nextInt(149));
        gameRef.child(newID).child("Q10").set(rnd.nextInt(149));

        return Game.getGame(numGames);
    }

    
}
