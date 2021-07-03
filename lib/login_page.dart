import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  // final Function(User?) onSignInAnonymously;
  final Function(User?) onSignIn;

  const LoginPage({Key? key, required this.onSignIn}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? error = "";
  bool isLogin = true;

  Future<void> loginAsAnon() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    // widget.onSignInAnonymously(userCredential.user);
    widget.onSignIn(userCredential.user);
  }

  Future<void> createUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      widget.onSignIn(userCredential.user);
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message;
      });
    }
  }

  Future<void> loginUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      widget.onSignIn(userCredential.user);
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    isLogin ? loginUser() : createUser();
                  },
                  child: Text(isLogin ? "Login" : "Create User"),
                ),
                ElevatedButton(
                  child: const Text("Sign in as Anonymous"),
                  onPressed: () => loginAsAnon(),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text("Switch to Login / Create account"),
                ),
              ],
            ),
            Text(error ?? ""),
          ],
        ),
      ),
    );
  }
}
