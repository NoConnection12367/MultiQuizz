import 'user.dart';
import 'question.dart';

class Game {
    var id = 0;
    var startTime = DateTime.now();
    var endTime = DateTime.now();
    List<User> memberList = new List<User> ();
    List<Question> questionList = new List<Question> ();
    
    Game()
    {
        // db-Aufruf - fill member

        //memberList = [new User("Domi"), new User("Moe"), new User("Flo")];
    }
}
