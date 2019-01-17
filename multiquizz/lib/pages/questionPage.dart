import 'dart:async';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
    QuestionPage({Key key}) : super(key: key);

    @override
    _QuestionPageState createState() => _QuestionPageState();

    // wenn frage beantwortet -> rekursiv aufrufen, id + 1 bis id = 10
    
    //Game game;
    //int id;
    // https://pub.dartlang.org/packages/percent_indicator

    // if (id < 10 )
    //     QuestionPage(id + 1)
}

class _QuestionPageState extends State<QuestionPage> {

    int _counter = 30;
    Timer _timmy;

    Color _countdownColor = Colors.grey[200];

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
                                        color: Colors.orange[300],
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
                            Container(
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
                            )
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
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.orange[100],
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                                Expanded(
                                                    child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Text(
                                                            "Frage 1 örklmweklrm fgölwkermg wölekrmö",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontSize: 18.0
                                                            ),
                                                        ),
                                                    )
                                                ),
                                            ],
                                        )
                                    )
                                ),
                            ),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.orange[100],
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                                Expanded(
                                                    child: Text(
                                                        "Frage 1 örklmweklrm fgölwkermg wölekrmö",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18.0
                                                        ),
                                                    ),
                                                ),
                                            ],
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
                                        padding: const EdgeInsets.all(5),
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.orange[100],
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                                Expanded(
                                                    child: Text(
                                                        "Frage 1 örklmweklrm fgölwkermg wölekrmö",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18.0
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        )
                                    )
                                ),
                            ),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.orange[100],
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                                Expanded(
                                                    child: Text(
                                                        "Frage 1 örklmweklrm fgölwkermg wölekrmö",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18.0
                                                        ),
                                                    ),
                                                ),
                                            ],
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
              _counter--;
            
            else
                _countdownColor = Color.fromARGB(255, 255, 0, 0);
            
        });
    }
}


