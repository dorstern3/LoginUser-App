import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:user/screen/home.dart';
import 'package:user/screen/login.dart';

import 'forgotPassword.dart';



class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  // text Controllers
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmpasswordController = TextEditingController();

// dispose memory
@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

Future signUp() async{
  // check if password == confirmpassword
  if(passwordConfirmed()){
await FirebaseAuth.instance.createUserWithEmailAndPassword(
   email: _emailController.text.trim(),
  password: _passwordController.text.trim(),
  );
     Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => home())
     );
}
}

// return True or False
bool passwordConfirmed(){
 if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
  return true; 
 }
 else{
  return false;
 }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 141, 187),
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          // Title

          Column(
            children: [
              Text("Register",
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

       // Confirm password
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
                controller: _confirmpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Confirm Password',
                              
                ) ,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),

        // Forget Password
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 25.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             GestureDetector(
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) {
               return forgotPassword();
              },
            ),
            );
            },
               child: Text('Forget Password?',
               style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
               ),
             ),
           ],
         ),
       ),
       SizedBox(height: 15),

        // Register button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
       child: GestureDetector(
            onTap: signUp,
            child:Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
              color: Colors.pink[400],
              borderRadius: BorderRadius.circular(20),),
              child:  Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
                ),),
            ),
          ),
        ),
        SizedBox(height: 30),

        // Login now
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('I am already register!',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16),
              ),
            GestureDetector(
              onTap: (){
            Navigator.pop(context);
            },
              child: Text(' Login',
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
