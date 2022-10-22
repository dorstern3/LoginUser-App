import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user/screen/login.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
            },
            color: Colors.pink[400],
            child: Text('sign out'),
            )
          ],
        ),),
    );
  }
}