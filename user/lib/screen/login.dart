import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
// text Controllers
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

Future signIn() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: _emailController.text.trim(),
  password: _passwordController.text.trim(),
  );
}

// dispose memory
@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 79, 178, 231),
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
           // Title

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

        // Email or Username
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
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email or Username',
                              
                ) ,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),

        // Password
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
                controller: _passwordController,
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

        // Login button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
       child: GestureDetector(
            onTap: signIn,
            child:Container(
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
        ),
        SizedBox(height: 30),

        // Register now
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('Not a member?',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16),
              ),
            GestureDetector(
              onTap: (){
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => register()),
            );
            },
              child: Text(' Register now',
              style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 16),
              ),
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
