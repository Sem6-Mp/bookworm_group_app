import 'package:app/sign_in.dart';
import 'package:app/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("LogOut"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        },
      )),
    );
  }
}
