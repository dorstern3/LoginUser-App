// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import '../functions/check.dart';



// class splash extends StatefulWidget {
//   const splash({super.key});

//   @override
//   State<splash> createState() => _splashState();
// }

// class _splashState extends State<splash> {

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Column(
//         children: [
//           Icon(
//             Icons.account_circle_outlined,
//             size: 90,
//             color: Color(0xffA460ED),
//           ),
//           Text(
//             'User App',
//             style: TextStyle(
//               fontSize: 50,
//               fontWeight: FontWeight.bold ,
//             color: Color(0xffF07DEA),
//             ),
//           ),
//         ],
//       ),
//       duration: 5000,
//       backgroundColor: Colors.black,
//       splashTransition: SplashTransition.fadeTransition,
//       animationDuration: Duration(seconds: 2),
//       nextScreen: check(),
//       splashIconSize: 250,
//     );
//   }
// }
