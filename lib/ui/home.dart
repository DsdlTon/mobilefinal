import 'package:flutter/material.dart';
import 'package:mobilefinal2/utils/checkUser.dart';



class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          children: <Widget>[
            ListTile(
              title: Text('Hello ${CheckUser.NAME}'),
              subtitle: Text('this is my quote "${CheckUser.QUOTE}"'),
            ),
            RaisedButton(
              child: Text("PROFILE SETUP"),
              onPressed: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            RaisedButton(
              child: Text("MY FRIENDS"),
              onPressed: () {
                Navigator.of(context).pushNamed('/friend');
              },
            ),
            RaisedButton(
              child: Text("SIGN OUT"),
              onPressed: () {
                CheckUser.USERID = null;
                CheckUser.NAME = null;
                CheckUser.AGE = null;
                CheckUser.PASSWORD = null;
                CheckUser.QUOTE = null;
                Navigator.of(context).pushReplacementNamed('/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }

}