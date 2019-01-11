import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
    LoginPage({Key key, this.title}) : super(key: key);

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".

    final String title;

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    void _login() {
        setState(() {

        });
    }

    @override
    Widget build(BuildContext context) {
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return Scaffold(
            appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(widget.title),
            ),
            body: Container(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        // Page headline
                        Container(
                            padding: const EdgeInsets.only(bottom: 35.0),
                            child: Text(
                                'Einloggen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                ),
                            ),
                        ),
                        // Username label
                        Container(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Text(
                                'Benutzername:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        // Username textfield
                        Container(
                            padding: const EdgeInsets.only(bottom: 35.0),
                            child: new TextField(
                                autofocus: true|false,
                            ),
                        ),
                        // Password label
                        Container(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Text(
                                'Passwort:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        // Password text field
                        Container(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: new TextField(
                                autofocus: true|false,
                                obscureText: true,
                            ),
                        ),
                        // Login button
                        new ButtonTheme(
                            minWidth: 200.0, 
                            child: RaisedButton(
                                padding: const EdgeInsets.all(8.0),
                                textColor: Colors.white,
                                color: Colors.blue,
                                onPressed: _login,
                                child: new Text("Einloggen"),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}