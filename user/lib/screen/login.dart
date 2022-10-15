import 'dart:io';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 141, 187),
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          // open text
          Column(
            children: [
              Text("Welcome to my",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35)
                ,),
                SizedBox(height: 5,),
                Text("User App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40)
                ,),
            ],
          ),
          SizedBox(height: 20,),

        // email or username
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12)
            ),
            
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email or Username',
                              
                ) ,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),

        // password
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12)
            ),
            
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                              
                ) ,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),

        // sign in button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
            color: Colors.pink[400],
            borderRadius: BorderRadius.circular(20),),
            child:  Center(
            child: Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
              ),),
          ),
        ),
        SizedBox(height: 30),

        // register now
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not a member?',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16),
            ),
            Text(' Register now',
            style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
            fontSize: 16),
            ),
          ],
        )



        ],
        ),
      ) ,
      )
    );
  }
}