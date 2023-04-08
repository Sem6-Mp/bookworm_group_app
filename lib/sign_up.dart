import 'package:app/home_screen.dart';
import 'package:app/reusable_widget/reusable_widget.dart';
import 'package:app/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/reusable_widget/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color.fromARGB(255, 14, 0, 43),
          Color.fromARGB(255, 40, 0, 42),
          Color.fromARGB(255, 65, 0, 47),
          Color.fromARGB(255, 111, 24, 60),
          Color.fromARGB(255, 131, 20, 37),
          Color.fromARGB(255, 122, 23, 10),
          Color.fromARGB(255, 122, 48, 11),
          Color.fromARGB(255, 215, 115, 15),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false,
                  _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email ID", Icons.email_outlined, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.password_outlined,
                  false, _passwordTextController),
              SizedBox(
                height: 40,
              ),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  print("Created Account Successfully");
                  Navigator.push(context as BuildContext,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              })
            ]),
          ),
        ),
      ),
    );
  }
}
