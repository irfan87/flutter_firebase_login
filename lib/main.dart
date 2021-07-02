import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/decisions_tree.dart';

// firebase stuff
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FirebaseLoginApp());
}

class FirebaseLoginApp extends StatelessWidget {
  const FirebaseLoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DecisionsTree(),
    );
  }
}
