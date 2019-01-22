import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../classes/game.dart';
import '../classes/question.dart';


class QuestionPage extends StatefulWidget {

	Game game;

    QuestionPage({Key key, Game game}) : super(key: key);

    @override
    _QuestionPageState createState() => _QuestionPageState(game);

    // wenn frage beantwortet -> rekursiv aufrufen, id + 1 bis id = 10
    
    //Game game;
    //int id;
    // https://pub.dartlang.org/packages/percent_indicator

    // if (id < 10 )
    //     QuestionPage(id + 1)
}

class _QuestionPageState extends State<QuestionPage> {

    Game game;

	_QuestionPageState(Game game){

        this.game = game;

		//List<Question> questionList = game.questionList;
	}

	double _progress = 1;
    int _counter = 30;
    Timer _timmy;
	
	
	List<Color> buttonColors = [Color.fromRGBO(150,150,150, 1), Color.fromRGBO(60,60,60, 1)];
	List<Color> falseAnswerColor = [Colors.red, Colors.red];

    Color _countdownColor = Colors.green;

    @override
    Widget build(BuildContext context) {

        _timmy = new Timer(Duration(seconds: 1), _countdown);    

        return Scaffold(
            appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text("Kategorie"),
            ),
            body: Column(
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
                                                        "FRAGE asdöfkl asdlöfjk asdflkj asödfjla söldfj alsdöjf a sdf asdf asdf?",
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
												colors: buttonColors, // whitish to gray
												tileMode: TileMode.repeated, // repeats the gradient over the canvas
											),
										),
                                        child: RaisedButton(
											color: const Color.fromARGB(0, 255, 255, 255),
											child: Text(
												"Antwort 1 örklm",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 18.0,
													color: Colors.white
												),
											),
											onPressed: (){
                                                // übergeben gegebene Antworttext
												getAnswer();
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
												colors: buttonColors, // whitish to gray
												tileMode: TileMode.repeated, // repeats the gradient over the canvas
											),
										),
                                        child: RaisedButton(
											color: const Color.fromARGB(0, 255, 255, 255),
											child: Text(
												"Antwort 2 kjdfs jklasdlfkj ",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 18.0,
													color: Colors.white
												),
											),
											onPressed: (){
                                                // übergeben gegebene Antworttext
												getAnswer();
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
												colors: buttonColors, // whitish to gray
												tileMode: TileMode.repeated, // repeats the gradient over the canvas
											),
										),
                                        child: RaisedButton(
											color: const Color.fromARGB(0, 255, 255, 255),
											child: Text(
												"Antwort 3 örka sdfa lm",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 18.0,
													color: Colors.white
												),
											),
											onPressed: (){
                                                // übergeben gegebene Antworttext
												getAnswer();
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
												colors: buttonColors, // whitish to gray
												tileMode: TileMode.repeated, // repeats the gradient over the canvas
											),
										),
                                        child: RaisedButton(
											color: const Color.fromARGB(0, 255, 255, 255),
											child: Text(
												"Antwort 4 örklm",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 18.0,
													color: Colors.white
												),
											),
											onPressed: (){
                                                // übergeben gegebene Antworttext
												getAnswer();
											},
										)		
                                    )
                                ),
                            ),
                        ]
                    )
                ],
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
                _countdownColor = Color.fromARGB(255, 255, 0, 0);
                showTrueAnswer();
            }
                
            
        });
    }

    void getAnswer(){
        _timmy.cancel();

        game.questionList[];
    }

    void showTrueAnswer(){
        // richtige Antwort grün blinken lassen
    }

    void markWrongAnswer(){
        // falsch gegebene Antwort rot färben
    }

}


