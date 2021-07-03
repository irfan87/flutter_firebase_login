import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Function(User?) onSignInAnonymously;

  const LoginPage({Key? key, required this.onSignInAnonymously})
      : super(key: key);

  Future<void> loginAsAnon() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    onSignInAnonymously(userCredential.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: ElevatedButton(
        child: const Text("Sign in as Anonymous"),
        onPressed: () {
          loginAsAnon();
        },
      ),
    );
  }
}
