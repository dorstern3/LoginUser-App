import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class after_login extends StatefulWidget {
  const after_login({super.key});

  @override
  State<after_login> createState() => _after_loginState();
}

class _after_loginState extends State<after_login> {

  final user =  FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('welcome: ' + user.email!,
              style: TextStyle(
              fontSize: 30),
              ),
            ),
            MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            },
            color: Colors.pink[400],
            child: Text('sign out'),
            )


          ],
        ),),
    );
  }
}