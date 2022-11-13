import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user/screen/login.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9FC9F3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      children: [
                        Text(
                          'Hey,  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          user.email!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xffA460ED),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Thank you for subscribing to my first app, see you in the next app.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              color: Color(0xffF07DEA),
              child: Text(
                'sign out',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}