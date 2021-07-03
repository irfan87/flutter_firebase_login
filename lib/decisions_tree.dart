import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase_login/home_page.dart';
import 'package:flutter_firebase_login/login_page.dart';

class DecisionsTree extends StatefulWidget {
  const DecisionsTree({Key? key}) : super(key: key);

  @override
  _DecisionsTreeState createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {
  User? user;

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoginPage(
        onSignInAnonymously: (userCred) => onRefresh(userCred),
      );
    }

    return const HomePage();

    // return LoginPage();
  }
}
