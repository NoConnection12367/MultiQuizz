import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
    QuestionPage({Key key}) : super(key: key);


    @override
    _QuestionPageState createState() => _QuestionPageState();


}

class _QuestionPageState extends State<QuestionPage> {
    
    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text("Kategorie"),
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Flexible(
                                child: Text("FRAGE asdöfkl asdlöfjk asdflkj asödfjla söldfj alsdöjf a sdf asdf asdf?"),
                            )
                        ],                       
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Flexible(
                                child: Text(
                                    "Frage 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                    ),
                                )
                            ),
                            Flexible(
                                child: Text("Frage 2")
                            ),
                        ]
                    ),
                    
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Flexible(
                                child: Text("Frage 3")
                            ),
                            Flexible(
                                child: Text("Frage 4")
                            ),
                        ]
                    ),
                ],
            )
        );
    }
}


