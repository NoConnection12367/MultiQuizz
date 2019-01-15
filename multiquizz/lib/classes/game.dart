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

        id = 0;
        startTime = DateTime.now();
        endTime = DateTime.now();
        // später mit DB-Aufruf
        memberList.add(new User(1, "Domi", "Blutwurst1", 9999));
        memberList.add(new User(2, "Moe", "Blutwurst1", 9998));
        memberList.add(new User(3, "Flo", "Blutwurst1", 9997));

        questionList = new List<Question> ();

    }

    
}
