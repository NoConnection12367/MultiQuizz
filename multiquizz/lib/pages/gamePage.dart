import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {

    String gameID;

    GamePage(String gameID)
    {
        this.gameID = gameID;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Games'),
            ),
            body: 
            Center(
                child: Column(
                    children: <Widget>[ 
                        // RaisedButton(
                        // child: Text("New Game"),
                        // onPressed: () {
                        //     /*Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => ;
                        //         )
                        //     );*/
                        // // Navigate to second screen when tapped!
                        //     }
                        // ),
                        Text(gameID.toString())
                    ]
                )
            ),
        );
    }
}