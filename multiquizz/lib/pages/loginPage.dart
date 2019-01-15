import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:multiquizz/pages/mainMenuPage.dart';
import 'dart:convert'; // for the utf8.encode method
import '../globals.dart' as globals;
import '../classes/user.dart';

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

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  Color _passwordTextColor = Colors.black;
  Color _usernameTextColor = Colors.black;


  Future _login() async {

    // Reset colors
    setState(() {
        _usernameTextColor = Colors.black;
        _passwordTextColor = Colors.black;
    });

    // Get username and password hash
    var username = usernameController.text;
    var password = passwordController.text;
    List<int> bytes = utf8.encode(password);
    String hash = sha256.convert(bytes).toString();

    // Database query
    CollectionReference ref = Firestore.instance.collection('user');
    QuerySnapshot eventsQuery = await ref
        .where("Name", isEqualTo: username)
        .getDocuments();

    if (eventsQuery.documents.length > 0) {

        eventsQuery.documents.forEach((document) {
            // Check if password is correct
            if (document["Password"] == hash) {
                print("Login successful");
                print(document["Name"]);

                // Set global user, goto menu page
                globals.activeUser = new User(document["ID"], document["Name"], document["Password"], document["Score"]);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuPage()),
                );

            }
            else {
                print("Wrong password");
                setState(() {
                    _passwordTextColor = Colors.red;
                });
            }
        });
    }
    else {
        print("User not found");
        setState(() {
            _usernameTextColor = Colors.red;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Starting to build login page..");

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
        child: ListView(
          children: [
            // Page headline
            Container(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Text(
                'Login',
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
                'Username:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _usernameTextColor
                ),
              ),
            ),
            // Username textfield
            Container(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: new TextField(
                controller: usernameController,
                style: new TextStyle(
                    color: _usernameTextColor
                ),
                autofocus: true | false,
              ),
            ),
            // Password label
            Container(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Text(
                'Password:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _passwordTextColor
                ),
              ),
            ),
            // Password text field
            Container(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: new TextField(
                controller: passwordController,
                style: new TextStyle(
                    color: _passwordTextColor
                ),
                autofocus: true | false,
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
                child: new Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
