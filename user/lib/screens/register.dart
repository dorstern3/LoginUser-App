import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user/services/firebaseAuthMethods.dart';
import '../provider/userData.dart';
import '../utils/showSnackBar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _fullNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  // Register with Email
  void signUp() async {
    // Check if password = confirmpassword
    if (passwordConfirmed()) {
      // Create user
      FirebaseAuthMethods(FirebaseAuth.instance).RegisterWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );

      // Add user deatails to firebase collection 'users'
      addUserDeatails(
        _fullNameController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  // Return True or False
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      showSnackBar(context, 'The passwords are not equal');
      return false;
    }
  }

// Add user deatails function
  Future addUserDeatails(String fullName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Full Name': fullName,
      'Email': email,
    });

    // Navigate to home page
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    final firebaseData = Provider.of<FirebaseAuthData>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff9FC9F3),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //backgroundColor: Color(0xff9FC9F3),
            children: [
              // Title
              Column(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                        color: Color(0xffF07DEA),
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              // Full Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      border: Border.all(color: Color(0xffA460ED)),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      border: Border.all(color: Color(0xffA460ED)),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
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
                      color: Color(0xffEEEEEE),
                      border: Border.all(color: Color(0xffA460ED)),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Confirm Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      border: Border.all(color: Color(0xffA460ED)),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Register Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: GestureDetector(
                  onTap: () {
                    firebaseData.userData['name'] =
                        _fullNameController.text.trim();
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim());
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xffF07DEA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I am already register!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      ' Login',
                      style: TextStyle(
                          color: Color(0xffA460ED),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
