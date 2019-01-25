import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../classes/game.dart';
import 'package:html_unescape/html_unescape.dart';
import 'gamePage.dart';


class QuestionPage extends StatefulWidget {

	final Game game;
    final int questionID;
    final int correctAnswerCount;

    QuestionPage({Key key, this.game, this.questionID, this.correctAnswerCount}) : super(key: key);

    @override
    _QuestionPageState createState() => _QuestionPageState(game, questionID, correctAnswerCount);

    // wenn frage beantwortet -> rekursiv aufrufen, id + 1 bis id = 10
    
    //Game game;
    //int id;
    // https://pub.dartlang.org/packages/percent_indicator

    // if (id < 10 )
    //     QuestionPage(id + 1)
}

class _QuestionPageState extends State<QuestionPage> {

    Game game;
    int questionID;
    int correctAnswerCount;

	_QuestionPageState(Game game, int questionID, int correctAnswerCount){

        this.game = game;
        this.questionID = questionID;
        this.correctAnswerCount = correctAnswerCount;

		//List<Question> questionList = game.questionList;
	}

	double _progress = 1;
    int _counter = 30;
    Timer _timmy;
    bool isAnswerGiven = false;
    bool isGivenAnserCorrect = false;
	
    static List<Color> buttonColor1 = [Color.fromRGBO(150,150,150, 1), Color.fromRGBO(60,60,60, 1)];
    static List<Color> buttonColor2 = [Color.fromRGBO(150,150,150, 1), Color.fromRGBO(60,60,60, 1)];
    static List<Color> buttonColor3 = [Color.fromRGBO(150,150,150, 1), Color.fromRGBO(60,60,60, 1)];
    static List<Color> buttonColor4 = [Color.fromRGBO(150,150,150, 1), Color.fromRGBO(60,60,60, 1)];

	List<List<Color>> buttonColors = [buttonColor1, buttonColor2, buttonColor3, buttonColor4];

    Color _countdownColor = Colors.green;
    Color _countdownBgColor = Color(0xFFB8C7CB);

    @override
    Widget build(BuildContext context) {

        if((_timmy == null || _timmy.isActive != true) && isAnswerGiven == false)
        {
            _timmy = new Timer(Duration(seconds: 1), _countdown);
        }
        
        var unescape = new HtmlUnescape();
        String questionText = unescape.convert(game.questionList[questionID].questionText);
        String answer1 = unescape.convert(game.questionList[questionID].answers[0]);
        String answer2 = unescape.convert(game.questionList[questionID].answers[1]);
        String answer3 = unescape.convert(game.questionList[questionID].answers[2]);
        String answer4 = unescape.convert(game.questionList[questionID].answers[3]);


        return Scaffold(
            appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text("Kategorie"),
            ),
            body: GestureDetector(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                            padding: const EdgeInsets.only(left: 15, right: 15),
                                            height: 200,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1),
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                color: Color.fromARGB(30, 0, 0, 255)
                                            ), 
                                            child: Row(
                                                children: <Widget>[
                                                    Expanded(
                                                        child: Text(
                                                            questionText,
                                                            style: TextStyle(
                                                                fontSize: 22.0
                                                            ),
                                                            textAlign: TextAlign.center,
                                                        ),
                                                    )
                                                ],
                                            ),
                                        ),
                                    ),
                                )
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                
                                LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.width - 50,
                                    lineHeight: 20.0,
                                    percent: _progress,
                                    center: Text(_counter.toString()),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: _countdownColor,
                                    backgroundColor: _countdownBgColor,
                                ),
                                
                                
                                
                                
                                /*Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: _countdownColor,
                                        border: Border.all(width: 1)
                                    ),
                                    child: Text(
                                        _counter.toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                        ),
                                        textAlign: TextAlign.center,
                                    ),
                                )*/
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                                        child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                                                    colors: buttonColors[0], // whitish to gray
                                                    tileMode: TileMode.repeated, // repeats the gradient over the canvas
                                                ),
                                            ),
                                            child: RaisedButton(
                                                color: const Color.fromARGB(0, 255, 255, 255),
                                                child: Text(
                                                    answer1,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white
                                                    ),
                                                ),
                                                onPressed: (){
                                                    getAnswer(answer1, 0);
                                                },
                                            )		
                                        )
                                    ),
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                                        child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                                                    colors: buttonColors[1], // whitish to gray
                                                    tileMode: TileMode.repeated, // repeats the gradient over the canvas
                                                ),
                                            ),
                                            child: RaisedButton(
                                                color: const Color.fromARGB(0, 255, 255, 255),
                                                child: Text(
                                                    answer2,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white
                                                    ),
                                                ),
                                                onPressed: (){
                                                    // übergeben gegebene Antworttext
                                                    getAnswer(answer2, 1);
                                                },
                                            )		
                                        )
                                    ),
                                ),
                            ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                                        child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                                                    colors: buttonColors[2], // whitish to gray
                                                    tileMode: TileMode.repeated, // repeats the gradient over the canvas
                                                ),
                                            ),
                                            child: RaisedButton(
                                                color: const Color.fromARGB(0, 255, 255, 255),
                                                child: Text(
                                                    answer3,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white
                                                    ),
                                                ),
                                                onPressed: (){
                                                    // übergeben gegebene Antworttext
                                                    getAnswer(answer3, 2);
                                                },
                                            )		
                                        )
                                    ),
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                                        child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                                                    colors: buttonColors[3], // whitish to gray
                                                    tileMode: TileMode.repeated, // repeats the gradient over the canvas
                                                ),
                                            ),
                                            child: RaisedButton(
                                                color: const Color.fromARGB(0, 255, 255, 255),
                                                child: Text(
                                                    answer4,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white
                                                    ),
                                                ),
                                                onPressed: (){
                                                    getAnswer(answer4, 3);
                                                },
                                            )		
                                        )
                                    ),
                                ),
                            ]
                        )
                    ],
                ),
                onTap: () {
                    if (isAnswerGiven == true) {
                        if (questionID < 9) {

                            if (isGivenAnserCorrect == true) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => QuestionPage(game: game, questionID: questionID + 1, correctAnswerCount: correctAnswerCount + 1)),
                                    ModalRoute.withName('/mainMenu'),
                                );
                            } 
                            else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => QuestionPage(game: game, questionID: questionID + 1, correctAnswerCount: correctAnswerCount)),
                                    ModalRoute.withName('/mainMenu'),
                                );
                            }
                            
                        }
                        else
                        {
                            update
                            
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => GamePage(game)),
                                ModalRoute.withName('/mainMenu'),
                            );
                        }
                    }
                },
            )
        );

        

    }

    void _countdown(){

        setState(() {

            if (_counter > 0)
			{
				_counter--;
				_progress = _counter / 30;
			}
              
            
            else
            {
                _timmy.cancel();
                _countdownColor = Color.fromARGB(255, 255, 0, 0);
                _countdownBgColor = Color.fromARGB(255, 255, 0, 0);

                markCorrectAnswer();
            }
                
        });
    }

    void getAnswer(String givenAnswer, int givenAnswerID){

        _timmy.cancel();
        
        if (isAnswerGiven == false) {

            if (givenAnswer == game.questionList[questionID].correctAnswer)
                rightAnswerResponse(givenAnswerID);
            
            else 
                wrongAnswerResponse(givenAnswerID);
            
            isAnswerGiven = true;
        }
    }

    void rightAnswerResponse(int givenAnswerID){
        // falsch gegebene Antwort grün färben
        setState(() {
            buttonColors[givenAnswerID] = [Colors.green, Colors.green];
            isGivenAnserCorrect = true;
        });
        
    }

    void wrongAnswerResponse(int givenAnswerID){
        // falsch gegebene Antwort rot färben
        int correctAnswerID;

        for(int i = 0; i < 4; i++){
            if (game.questionList[questionID].correctAnswer == game.questionList[questionID].answers[i]) {
                correctAnswerID = i;
                break;
            }
        }

        setState(() {
            buttonColors[correctAnswerID] = [Colors.green, Colors.green];
            buttonColors[givenAnswerID] = [Colors.red, Colors.red];
            isGivenAnserCorrect = false;
        });
        
    }

    void markCorrectAnswer(){
        int correctAnswerID;

        for(int i = 0; i < 4; i++){
            if (game.questionList[questionID].correctAnswer == game.questionList[questionID].answers[i]) {
                correctAnswerID = i;
                break;
            }
        }

        setState(() {
            buttonColors[correctAnswerID] = [Colors.green, Colors.green];
        });

        isAnswerGiven = true;
    }

}


