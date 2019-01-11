import 'user.dart';
import 'question.dart';

class Game {
    var id;
    var startTime;
    var endTime;
    List<User> memberList = new List<User> ();
    List<Question> questionList = new List<Question> ();
    
    Game()
    {
        // db-Aufruf - fill member
    }
}
