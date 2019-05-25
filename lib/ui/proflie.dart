import 'package:flutter/material.dart';
import 'package:mobilefinal2/model/database.dart';
import 'package:mobilefinal2/utils/checkUser.dart';


class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>{
  final _formKey = GlobalKey<FormState>();

  UserUtils user = UserUtils();
  final _userIdControl = TextEditingController(text: CheckUser.USERID);
  final _nameControl = TextEditingController(text: CheckUser.NAME);
  final _ageControl = TextEditingController(text: CheckUser.AGE);
  final _passwordControl = TextEditingController();
  final _quoteControl = TextEditingController(text: CheckUser.QUOTE);
  bool userAlready = false;

  int findSpace(String text) {
    int space = 0;
    for (int i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        space += 1;
      }
    }
    return space;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTER"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: _userIdControl,
                decoration: InputDecoration(
                  labelText: "User Id",
                  hintText: "Please input your ID",
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill out this form";
                  } else if (value.length < 6 || value.length > 12) {
                    return "Please fill user ID between 6-12 charecter";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: _nameControl,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Please input your Name",
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill out this form";
                  } else if (findSpace(value) != 1) {
                    return "Please enter your Name and Surname";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: _ageControl,
                decoration: InputDecoration(
                  labelText: "Age",
                  hintText: "Please input your Age",
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill out this form";
                  } else if (int.parse(value) < 10 || int.parse(value) > 80) {
                    return "You must between 10 to 80 to register";
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
                  } else if (value.length < 6) {
                    return "Password must be more than 6 charecter";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: _quoteControl,
                decoration: InputDecoration(
                  labelText: "Quote",
                  hintText: "What you think?",
                  icon: Icon(Icons.select_all),
                ),
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
            ),
             Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: RaisedButton(
                  child: Text("SAVE"),
                  onPressed: () async {
                    await user.open("user.db");
                    Future<List<User>> allUser = user.getAllUser();
                    User userData = User();
                    userData.userid = _userIdControl.text;
                    userData.name = _nameControl.text;
                    userData.age = _ageControl.text;
                    userData.password = _passwordControl.text;
                    userData.quote = _quoteControl.text;
                    Future isUserExisted(User user) async {
                      var userList = await allUser;
                      for (var i = 0; i < userList.length; i++) {
                        if (user.userid == userList[i].userid && CheckUser.ID != userList[i].id) {
                          this.userAlready = true;
                          break;
                        }
                      }
                    }

                    if (_formKey.currentState.validate()) {
                      await isUserExisted(userData);

                      if(!this.isUserEx)
                    }

                    this.userAlready = false;

                    Future showAllUser() async {
                      var userList = await allUser;
                      for (var i = 0; i < userList.length; i++) {
                        print(userList[i]);
                      }
                    }

                    showAllUser();

                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}