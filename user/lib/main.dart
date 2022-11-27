import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user/check.dart';
import 'package:user/screen/splash.dart';
import 'firebase_options.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
  );
// FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
// FirebaseMessaging messaging = FirebaseMessaging.instance;



//   NotificationSettings settings = await messaging.requestPermission(
//   alert: true,
//   announcement: false,
//   badge: true,
//   carPlay: false,
//   criticalAlert: false,
//   provisional: false,
//   sound: true,

  
// );

// FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   print('Got a message whilst in the foreground!');
//   print('Message data: ${message.data}');

//   if (message.notification != null) {
//     print('Message also contained a notification: ${message.notification}');
//   }
// });

// print('User granted permission: ${settings.authorizationStatus}');
runApp(const MyApp());
}
   

// Task:
// 1. navbar -> screens[currentIndex]
// 2. facebook and google login -> try again
// 3. home page change to user name
// 4. push notifications + 10 sec delay


 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
