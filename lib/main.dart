import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/AdminLogin.dart';
import 'package:myapp/admin/AddManager.dart';
import 'package:myapp/admin/Admin1stscreen.dart';
import 'package:myapp/admin/admindonor.dart';
import 'package:myapp/loginScreen.dart';
import 'package:myapp/mainscreens/adddonors.dart';
import 'package:myapp/mainscreens/donationscreen.dart';
import 'package:myapp/mainscreens/donordetail.dart';
import 'package:myapp/splashScreen.dart';
import 'firebase_options.dart';

// Global object for accessing device screen size
late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('-- main: Firebase.initializeApp');

  // Enter full-screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Set preferred orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize the media query
  mq = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
