import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/screens/login.dart';
import '../provider/userData.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
// Database collection firebase
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    // Varible for firebase
    final firebaseData = Provider.of<FirebaseAuthData>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xff9FC9F3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      children: [
                        FirebaseAuth.instance.currentUser?.displayName ==
                                null // if the user has no name it will show a loading circle
                            ? FutureBuilder(
                                future: FirebaseAuth.instance.currentUser
                                    ?.updateDisplayName(// update user name
                                        firebaseData.userData['name']),
                                builder: (context, snapshot) {
                                  // if user login from Register Page successfully
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Hey, ',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                        Text(
                                          '${FirebaseAuth.instance.currentUser?.displayName} ',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 30,
                                            color: Color(0xffA460ED),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    // if user login failed
                                    return const CircularProgressIndicator(
                                        color: Colors.black);
                                  }
                                })
                            // if user login from Login Page/Facebook/Google successfully
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hey, ',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    '${FirebaseAuth.instance.currentUser?.displayName!}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Color(0xffA460ED),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Thank you text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Thank you for subscribing to my user app, see you in the next app.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Sign out button
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              color: const Color(0xffF07DEA),
              child: const Text(
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
