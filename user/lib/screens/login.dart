// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:user/services/facebookLogin.dart';
// import 'package:user/services/googleLogin.dart';
// import 'register.dart';
// import 'forgotPassword.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {

// // text Controllers
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   Future signIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: _emailController.text.trim(),
//       password: _passwordController.text.trim(),
//     );
//   }

// // dispose memory
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

// //bottomNavigationBar
// int currentIndex=0;
// final screens = {
// Login(),
// register(),
// };


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff9FC9F3),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Title
//               Column(
//                 children: [
//                   Text(
//                     "Welcome to my",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "User App",
//                     style: TextStyle(
//                         color: Color(0xffA460ED),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 40),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),

//               // Email 
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xffEEEEEE),
//                       border: Border.all(color: Color(0xffF07DEA)),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15.0),
//                     child: TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Email',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Password
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xffEEEEEE),
//                       border: Border.all(color: Color(0xffF07DEA)),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15.0),
//                     child: TextField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Password',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Forget Password
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return forgotPassword();
//                             },
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Forget Password?',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Login Button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 100.0),
//                 child: GestureDetector(
//                   onTap: signIn,
//                   child: Container(
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Color(0xffA460ED),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Sign in',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Facebook Button
//               SignInButton(
//                 Buttons.Facebook,
//                 text: "Sign in with Facebook",
//                 onPressed: () {
//                    Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => facebookLogin()),
//                       );
//                 },
//               ),
//               SizedBox(height: 10),

//               // Google Button
//               SignInButton(
//                 Buttons.Google,
//                 text: "Sign in with Google",
//                 onPressed: () {
//                   //  Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(builder: (context) => googleLogin()),
//                   //     );
//                 },
//               ),
//               SizedBox(height: 20),

//               // Register Now
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Not a member?',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => register()),
//                       );
//                     },
//                     child: Text(
//                       ' Register now',
//                       style: TextStyle(
//                           color: Color(0xffF07DEA),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ],  
//           ),
//         ),
//       ),
//       // bottomNavigationBar
//       //screens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (index) => setState(()=> currentIndex = index),
//         iconSize: 30,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Color(0xff9FC9F3),
//         selectedFontSize: 20,
//         selectedItemColor: Color(0xffA460ED),
//         unselectedFontSize: 18,
//         unselectedItemColor: Color(0xffF07DEA),
//         showUnselectedLabels: true,
        
//      items:[
//       BottomNavigationBarItem(
//         icon: Icon(Icons.login),
//         label: 'Login',
//         backgroundColor: Colors.green,
//         ),

//         BottomNavigationBarItem(
//         icon: Icon(Icons.app_registration),
//         label: 'Register',
//         backgroundColor: Colors.blue,
//         ), 
//      ],
//       ),
      
//     );
//   }
// }
