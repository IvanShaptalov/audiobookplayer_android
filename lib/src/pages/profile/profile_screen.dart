// ignore_for_file: must_be_immutable

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
  Email email = Email();
  Password pass = Password();
  Login login = Login();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  static const String routeName = '/profile';

  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: MediaConfig.getmediaHeight(context) / 6,
          child: TextButton(onPressed: (){
            Navigator.restorablePushNamed(context, Statistics.routeName);
          },child: const Text('stats')),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('email'),
            SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: _emailKey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? inValue) {
                            if (inValue!.isEmpty) {
                              return "Enter valid email please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            email.email = inValue!;
                          },
                          decoration: const InputDecoration(
                              hintText: "enter email",
                              labelText: "Enter new email")),
                      IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: () {
                            if (_emailKey.currentState!.validate()) {
                              _emailKey.currentState?.save();
                              // print("New email: ${email.email}");
                            }
                          })
                    ]))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('login'),
            SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: _loginKey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (String? inValue) {
                            if (inValue!.isEmpty) {
                              return "Enter valid login please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            login.login = inValue!;
                          },
                          decoration: const InputDecoration(
                              hintText: "enter login",
                              labelText: "Enter new login")),
                      IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: () {
                            if (_loginKey.currentState!.validate()) {
                              _loginKey.currentState?.save();
                              // print("New login: ${login.login}");
                            }
                          })
                    ]))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('password'),
            SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: _passKey,
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
                            pass.password = inValue!;
                          },
                          decoration: const InputDecoration(
                              hintText: "enter password",
                              labelText: "Enter new password")),
                      IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: () {
                            if (_passKey.currentState!.validate()) {
                              _passKey.currentState?.save();
                              // print("Password changed");
                            }
                          })
                    ]))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaConfig.getmediaHeight(context) / 12,
              width: MediaConfig.getmediaWidht(context) / 2,
              color: Colors.red,
              child: TextButton(onPressed: () {}, child: const Text('Log out')),
              
            ),
          ],
        ),
        Player()
      ]),
    );
  }
}
