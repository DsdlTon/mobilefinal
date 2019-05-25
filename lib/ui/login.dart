import 'package:flutter/material.dart';
import 'package:mobilefinal2/model/database.dart';
import 'package:mobilefinal2/utils/checkUser.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool isUserValid = false;

  UserUtils user = UserUtils();
  final _userIdControl = new TextEditingController();
  final _passwordControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(
                "images/jordan.jpg",
              ),
              padding: EdgeInsets.fromLTRB(70.0, 30.0, 70.0, 0.0),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: _userIdControl,
                decoration: InputDecoration(
                  labelText: "User ID",
                  hintText: "Please input your User Id",
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill out this form";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: _passwordControl,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Please input your password",
                  icon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill out this form";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: RaisedButton(
                child: Text("LOGIN"),
                onPressed: () async {
                  _formKey.currentState.validate();
                  await user.open("user.db");
                  Future<List<User>> getAUser = user.getAllUser();

                  Future isCurrentUserValid(String userid, String password) async {
                    var userList = await getAUser;
                    for (var i = 0; i < userList.length; i++) {
                      if (userid == userList[i].userid && password == userList[i].password) {
                        CheckUser.ID = userList[i].id;
                        CheckUser.USERID = userList[i].userid;
                        CheckUser.NAME = userList[i].name;
                        CheckUser.AGE = userList[i].age;
                        CheckUser.PASSWORD = userList[i].password;
                        this.isUserValid = true;
                        print("this user valid");
                        // break;
                      }
                    }
                  }

                  // if (!this.isUserValid) {
                  //   Toast.show("invalid user or password", context,
                  //       duration: Toast.LENGTH_LONG);
                  // } else {
                    Navigator.pushNamed(context, '/HomePage');
                  // }
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ButtonTheme(
                padding: EdgeInsets.only(right: 30),
                child: FlatButton(
                  child: Text("Register New Account"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, '/RegisterPage');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
