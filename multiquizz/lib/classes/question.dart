import 'game.dart';
import 'user.dart';

class Question {

    var id;
    var questionText;
    String correctAnswers;
    List<String> falseAnswers = new List<String> ();
    
    Question()
    {
        // db-Aufruf - fill member
    }

    bool getAnswer(User user, Game game){
        // db-Abfrage
        
        return false;
    }
}

