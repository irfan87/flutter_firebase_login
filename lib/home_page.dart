import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function(User?) onSignOut;

  HomePage({required this.onSignOut});

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    onSignOut(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: TextButton(
          child: const Text("Log out"),
          onPressed: () => logOut(),
        ),
      ),
    );
  }
}
