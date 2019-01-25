import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

class Question {

    var id;
    String questionText;
    String category;
    String difficulty;
    String correctAnswer;
    List<String> answers = new List<String>();
    
    Question()
    {
        // db-Aufruf - fill member
    }

    Question.fromSnapshot(DataSnapshot snapshot) {
        // Initialize properties
        this.id = int.parse(snapshot.key);
        this.questionText = snapshot.value["question"];
        this.category = snapshot.value["category"];
        this.difficulty = snapshot.value["difficulty"];
        this.correctAnswer = snapshot.value["correct_answer"];

        // Build list of answers
        this.answers.add(snapshot.value["correct_answer"]);
        var incorrectAnswers = snapshot.value["incorrect_answers"];
        for (var answer in incorrectAnswers) {
            this.answers.add(answer);
        }

        // Randomize list order
        this.answers = shuffle(this.answers);
    }

    static Future<Question> getQuestion(int id) async {
        
        // Get user with given ID from database
        DatabaseReference questionRef = FirebaseDatabase.instance.reference().child('Resource').child('Questions').child(id.toString());

        DataSnapshot snapshot = await questionRef.reference().once();
        return Question.fromSnapshot(snapshot);
    }

    List shuffle(List items) {
        var random = new Random();

        // Go through all elements.
        for (var i = items.length - 1; i > 0; i--) {

            // Pick a pseudorandom number according to the list length
            var n = random.nextInt(i + 1);

            var temp = items[i];
            items[i] = items[n];
            items[n] = temp;
        }

        return items;
    }
}

