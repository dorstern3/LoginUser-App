import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:user/screen/home.dart';
import 'package:user/screen/login.dart';
import '../check.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
// void initState(){
//   super.initState();
//   navigateToHome();
// }

// navigateToHome() async{
//   await Future.delayed(Duration(milliseconds: 5000),(){});
//   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>check()));
// }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splash: Column(
        children: [
          Icon(
            Icons.home,
            size: 90,
            color: Color(0xffA460ED),
          ),
          Text(
            'User Application',
            style: TextStyle(
              fontSize: 50,
            color: Color(0xffF07DEA),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff9FC9F3),
      nextScreen: Login(),
      splashIconSize: 250,
    );
  }
}
