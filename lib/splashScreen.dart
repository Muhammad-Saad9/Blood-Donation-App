import 'package:flutter/material.dart';
import 'package:myapp/loginScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to the splash screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the main screen after 3 seconds
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFEB3738),
 // Set the background color for the splash screen
      body: 
      Center(
        child:
        
         Container(
          width: double.infinity,
          height: double.infinity,
        child:   Column(
        children: [
          SizedBox(height: 275,),
           Center(
          child: Image.asset("assets/water 1.png"),
          
        ),
Center(
  child: Text("Zindgi",
  
  style: TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w200,
  )
  ,),
)
        ],
      ),
        ),
      ),
     
    );
  }
}

