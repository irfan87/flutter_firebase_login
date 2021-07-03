import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          onPressed: () {},
        ),
      ),
    );
  }
}
