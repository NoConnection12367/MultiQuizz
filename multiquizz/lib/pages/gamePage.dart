import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Games'),
            ),
            body: Center(
                child: RaisedButton(
                    child: Text("New Game"),
                    onPressed: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ;
                            )
                        );*/
                    // Navigate to second screen when tapped!
                    }
                ),
            ),
        );
    }
}