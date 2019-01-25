
import 'package:flutter/material.dart';
import 'package:multiquizz/classes/game.dart';
import 'package:multiquizz/pages/questionPage.dart';


class StartGameButtonPage extends StatefulWidget {
  StartGameButtonPage({Key key, this.game, this.opponentID, this.title}) : super(key: key);

  final String title;
  final int opponentID;
  final Game game;

  @override
  _StartGameButtonPage createState() => _StartGameButtonPage(opponentID, game);
}

class _StartGameButtonPage extends State<StartGameButtonPage> {

    int opponentID;
    Game game;

    _StartGameButtonPage(this.opponentID, this.game);

    @override
    Widget build(BuildContext context) {
        print("Starting to build startGameButton page..");
        
        return new Scaffold(
            appBar: new AppBar(
              title: new Text('Start game'),
            ),
            body: Container(
                alignment: Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(30),
                child: new ButtonTheme(
                    padding: const EdgeInsets.all(30.0),
                    minWidth: double.infinity,
                    height: 70,
                    child: RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: startGame,
                        child: new Text(
                            "Start Game",
                            style: TextStyle(
                                fontSize: 22
                            ),
                        ),
                    ),
                ),
            )
        );
    }

    void startGame() async
    {
        if (game == null)
        {
            // Init new game
            Game newGame = await Game.createNewGame(opponentID);
            
            // Launch questionpages
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => QuestionPage(game: newGame, questionID: 0, correctAnswerCount: 0,)),
                ModalRoute.withName('/mainMenu'),

            );
        }
        else
        {
            // Launch questionpages
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => QuestionPage(game: this.game, questionID: 0, correctAnswerCount: 0,)),
                ModalRoute.withName('/mainMenu'),
            );
        }
    }
}