import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:multiquizz/pages/mainMenuPage.dart';
import '../globals.dart' as globals;
import '../classes/statistics.dart';

class StatisticsPage extends StatefulWidget {

    StatisticsPage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _StatisticsPage createState() => _StatisticsPage();
}

class _StatisticsPage extends State<StatisticsPage> {

    Statistics stats = new Statistics();

    _StatisticsPage() {

        loadStats();
    }

    @override
    Widget build(BuildContext context) {

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

        var statStyle = TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
        );

        return new Scaffold(
            appBar: new AppBar(
                title: new Text('MultiQuizz'),
            ),
            body: Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                    children: <Widget>[
                        new Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 35),
                            child: new Row(
                                children: <Widget>[
                                    Expanded(
                                        child: Column(
                                            children: <Widget>[
                                                Container(
                                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                                    child: Text(
                                                        "Won",
                                                        style: nameStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.wonGames.toString(),
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
                                                        "Lost",
                                                        style: nameStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.lostGames.toString(),
                                                    style: pointStyle,
                                                ),
                                            ],
                                        ),
                                    )
                                ],
                            ),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Column(
                                children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                        child: Row(
                                            children: <Widget>[
                                                Container(
                                                    width: 230,
                                                    child: Text(
                                                        "Total games played:",
                                                        style: statStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.totalGames.toString(),
                                                    style: statStyle,
                                                ),
                                            ],
                                        ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                        child: Row(
                                            children: <Widget>[
                                                Container(
                                                    width: 230,
                                                    child: Text(
                                                        "Total won games:",
                                                        style: statStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.wonGames.toString(),
                                                    style: statStyle,
                                                ),
                                            ],
                                        ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                        child: Row(
                                            children: <Widget>[
                                                Container(
                                                    width: 230,
                                                    child: Text(
                                                        "Total lost games:",
                                                        style: statStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.lostGames.toString(),
                                                    style: statStyle,
                                                ),
                                            ],
                                        ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                        child: Row(
                                            children: <Widget>[
                                                Container(
                                                    width: 230,
                                                    child: Text(
                                                        "Total draw games:",
                                                        style: statStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.drawGames.toString(),
                                                    style: statStyle,
                                                ),
                                            ],
                                        ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                        child: Row(
                                            children: <Widget>[
                                                Container(
                                                    width: 230,
                                                    child: Text(
                                                        "Total right answers:",
                                                        style: statStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.rightAnswers.toString(),
                                                    style: statStyle,
                                                ),
                                            ],
                                        ),
                                    ),
                                    Container(
                                        child: Row(
                                            children: <Widget>[
                                                Container(
                                                    width: 230,
                                                    child: Text(
                                                        "Right answer probability:",
                                                        style: statStyle,
                                                    ),
                                                ),
                                                Text(
                                                    stats.getRightAnswerProbability().toStringAsFixed(0) + "%",
                                                    style: statStyle,
                                                ),
                                                
                                            ],
                                        ),
                                    ),
                                ],
                            )
                        ),
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget> [
                                    new ButtonTheme(
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

    void loadStats() async {

        DatabaseReference gameRef = FirebaseDatabase.instance.reference().child('Statistics');
        dynamic snapshot = await gameRef.child(globals.activeUser.id.toString()).once();

        if (snapshot.value != null) {

            Statistics stats = new Statistics();
            stats.wonGames = snapshot.value["WonGames"];
            stats.lostGames = snapshot.value["LostGames"];
            stats.drawGames = snapshot.value["DrawGames"];
            stats.rightAnswers = snapshot.value["RightAnswers"];
            stats.totalGames = snapshot.value["TotalGames"];
            stats.userID = snapshot.value["UserID"];

            setState(() {
                this.stats = stats;
            });
        }
    }

    void mainMenuButtonPressed(BuildContext context) {

        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainMenuPage()),
                ModalRoute.withName('/mainMenu')
            );
    }

}
