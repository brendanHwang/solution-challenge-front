import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_front/screen/home.dart';
import 'package:solution_challenge_front/screen/home_screen.dart';
import 'package:solution_challenge_front/screen/sign_in_screen.dart';


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) return SignInScreen();
          return const Home();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}