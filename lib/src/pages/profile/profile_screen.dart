import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:audiobook_player/src/pages/statistics/statistics.dart';
import 'package:flutter/material.dart';

class Email {
  String email = "";
}

class Password {
  String password = "";
}

class Login {
  String login = "";
}

class ProfileScreen extends StatelessWidget {
  Email email = new Email();
  Password pass = new Password();
  Login login = new Login();
  GlobalKey<FormState> _emailKey = new GlobalKey<FormState>();
  GlobalKey<FormState> _passKey = new GlobalKey<FormState>();
  GlobalKey<FormState> _loginKey = new GlobalKey<FormState>();

  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Screen')),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: MediaConfig.getmediaHeight(context) / 6,
          child: TextButton(onPressed: (){
            Navigator.restorablePushNamed(context, Statistics.routeName);
          },child: Text('stats')),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('email'),
            Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: this._emailKey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? inValue) {
                            if (inValue?.length == 0) {
                              return "Enter valid email please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            this.email.email = inValue!;
                          },
                          decoration: InputDecoration(
                              hintText: "enter email",
                              labelText: "Enter new email")),
                      IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () {
                            if (_emailKey.currentState!.validate()) {
                              _emailKey.currentState?.save();
                              print("New email: ${this.email.email}");
                            }
                          })
                    ]))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('login'),
            Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: this._loginKey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (String? inValue) {
                            if (inValue?.length == 0) {
                              return "Enter valid login please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            this.login.login = inValue!;
                          },
                          decoration: InputDecoration(
                              hintText: "enter login",
                              labelText: "Enter new login")),
                      IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () {
                            if (_loginKey.currentState!.validate()) {
                              _loginKey.currentState?.save();
                              print("New login: ${this.login.login}");
                            }
                          })
                    ]))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('password'),
            Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: this._passKey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          validator: (String? inValue) {
                            if (inValue?.length != null &&
                                inValue!.length < 8) {
                              return "Enter at least 8 symbols";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            this.pass.password = inValue!;
                          },
                          decoration: InputDecoration(
                              hintText: "enter password",
                              labelText: "Enter new password")),
                      IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () {
                            if (_passKey.currentState!.validate()) {
                              _passKey.currentState?.save();
                              print("Password changed");
                            }
                          })
                    ]))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: TextButton(onPressed: () {}, child: Text('Log out')),
              height: MediaConfig.getmediaHeight(context) / 12,
              width: MediaConfig.getmediaWidht(context) / 2,
              color: Colors.red,
              
            ),
          ],
        ),
        Player()
      ]),
    );
  }
}
