import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {

    StatisticsPage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _StatisticsPage createState() => _StatisticsPage();
}

class _StatisticsPage extends State<StatisticsPage> {
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
            fontWeight: FontWeight.w300,
        );

        return new Scaffold(
            appBar: new AppBar(
                title: new Text('MultiQuizz'),
            ),
            body: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        new Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
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
                                                    "3",
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
                                                    "15",
                                                    style: pointStyle,
                                                ),
                                            ],
                                        ),
                                    )
                                ],
                            ),
                        ),
                        new Expanded(
                            child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        Text(
                                            "Total games played:",
                                            style: statStyle,
                                        ),
                                        Text(
                                            "Total right answers:",
                                            style: statStyle,
                                        ),
                                        Text(
                                            "Right answer probability:",
                                            style: statStyle,
                                        ),
                                    ],
                                )
                            ),
                        ),
                    ],
                ),
            ),

        );
    }

}
