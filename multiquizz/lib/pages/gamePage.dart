import 'package:flutter/material.dart';
import 'package:multiquizz/classes/game.dart';
import 'package:multiquizz/pages/mainMenuPage.dart';
import '../globals.dart' as globals;

class GamePage extends StatelessWidget {

    final Game game;
    static final IconData checkCircleOutline = IconData(0xe92d, fontFamily: 'MaterialIcons');
    static final IconData highlightOff = IconData(0xe888, fontFamily: 'MaterialIcons');
    static final IconData queryBuilder = IconData(0xe8ae, fontFamily: 'MaterialIcons');
    static final IconData pauseCircleOutline = IconData(0xe036, fontFamily: 'MaterialIcons');

    GamePage(this.game);

    var nameStyle = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w300,
    );

    var pointStyle = TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w700,
    );

    var colonStyle = TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.w800,
    );

    @override
    Widget build(BuildContext context) {

        IconData iconToShow;
        Color iconColor;
        String caption;

        // Calculate win
        if (game.isFinished == false)
        {
            // -> Opponent hasn't played yet
            iconToShow = queryBuilder;
            iconColor = Colors.blue;
            caption = "Pending..";
        }
        else if (game.creatorRightAnswers == game.opponentRightAnswers)
        {
            // -> Draw
            iconToShow = pauseCircleOutline;
            iconColor = Colors.blue;
            caption = "Draw";
        }
        else
        {
            // Calc wo has won
            bool creatorHasWon = game.creatorRightAnswers > game.opponentRightAnswers;

            if (globals.activeUser.id == game.creator.id)
            {
                if (creatorHasWon)
                {
                    iconToShow = checkCircleOutline;
                    iconColor = Colors.green;
                    caption = "Win";
                }
                else
                {
                    iconToShow = highlightOff;
                    iconColor = Colors.red;
                    caption = "Lost";
                }
            }
            else
            {
                if (creatorHasWon)
                {
                    iconToShow = highlightOff;
                    iconColor = Colors.red;
                    caption = "Lost";
                }
                else
                {
                    iconToShow = checkCircleOutline;
                    iconColor = Colors.green;
                    caption = "Win";
                }
            }

        }


        return Scaffold(
            appBar: AppBar(
                title: Text('Game Overview'),
            ),
            body: Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                    children: <Widget>[
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                            child: Column(
                                children: <Widget>[
                                    Icon(
                                        iconToShow, 
                                        size:150, 
                                        color:iconColor
                                    ),
                                    Text(
                                        caption,
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900,
                                            color: iconColor
                                        ),
                                    )
                                ],
                            ),
                        ),
                        Row(
                            children: <Widget>[
                                Expanded(
                                    child: Column(
                                        children: <Widget>[
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                                child: Text(
                                                    game.creator.name,
                                                    style: nameStyle,
                                                ),
                                            ),
                                            Text(
                                                game.creatorRightAnswers.toString(),
                                                style: pointStyle,
                                            ),
                                        ],
                                    ),
                                ),
                                Container(
                                    child: Text(
                                            ":",
                                            style: colonStyle,
                                        ),
                                ),
                                Expanded(
                                    child: Column(
                                        children: <Widget>[
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                                child: Text(
                                                    game.opponent.name,
                                                    style: nameStyle,
                                                ),
                                            ),
                                            Text(
                                                game.opponentRightAnswers.toString(),
                                                style: pointStyle,
                                            ),
                                        ],
                                    ),
                                )
                            ],
                        ),
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget> [
                                    new ButtonTheme(
                                        padding: const EdgeInsets.all(30.0),
                                        minWidth: double.infinity,
                                        height: 60,
                                        child: RaisedButton(
                                            padding: const EdgeInsets.all(8.0),
                                            textColor: Colors.white,
                                            color: Colors.blue,
                                            onPressed: () { mainMenuButtonPressed(context); },
                                            child: new Text(
                                                "Back to main menu >",
                                                style: TextStyle(
                                                    fontSize: 22
                                                ),
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }

    void mainMenuButtonPressed(BuildContext context) {

        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainMenuPage()),
                ModalRoute.withName('/mainMenu')
            );
    }
}