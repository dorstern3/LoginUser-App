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
            Text('signed in as: ' + user.email!),
            MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            },
            color: Colors.amber,
            child: Text('sign out'),
            )


          ],
        ),),
    );
  }
}