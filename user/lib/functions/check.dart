import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user/screen/login.dart';
import 'screen/home.dart';

class check extends StatelessWidget {
  const check({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return home();
        } else {
          return Login();
        }
      },
      ),
      );
  }
}









