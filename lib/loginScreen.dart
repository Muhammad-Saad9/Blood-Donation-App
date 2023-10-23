import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/AdminLogin.dart';
import 'package:myapp/mainscreens/adddonors.dart';
import 'package:myapp/mainscreens/donationscreen.dart';
import 'package:myapp/mainscreens/donordetail.dart';
import 'package:myapp/register.dart';
import 'package:myapp/splashScreen.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController paswordcontroller = TextEditingController();
  bool islogginin = false;
  login() async {
    try {
      islogginin = true;
      setState(() {});
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: paswordcontroller.text,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddDonorScreen()));
    } on FirebaseAuthException catch (e) {
      setState(() {});
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      
  //       appBar:
  //       // PreferredSize(
  // // // preferredSize: Size.fromHeight(220.0),
  
  //  AppBar(
  //     backgroundColor: Color.fromARGB(255, 187, 45, 45),
  //   ),

         
      // backgroundColor:  Color.fromARGB(255, 228, 47, 15),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.red,
      height:  300,
      width:  double.infinity,
      child: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              child: Image.asset("assets/water 1.png",
      ),
            ),
          ),
          Center(
            child: Container(
              child: Text("Zindgi",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
              
              ),
            ),)
        ],
      ),
      
          ),
          
          
      Container(
        // color: Colors.amber,
      
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           color: Colors.white,
           boxShadow: [
        BoxShadow(
          color: Colors.black, // Set the shadow color to black
          blurRadius: 20,       // Set the blur radius as needed
          offset: Offset(0, 2), // Set the offset (x, y) as needed
        ),
          ],
        ),
        child: Center(
          child: Column(
        children: [
          SizedBox(height: 2,),
          Container(
          width: 320,
        child: Text("\nEmail",),
        ),
         Container(
          
          child: TextField(
        controller: emailcontroller,
        decoration: InputDecoration(
          hintText: '   Enter your email',
          hintStyle: TextStyle(
        color: const Color.fromARGB(255, 51, 51, 51),
         // Adjust the font size as needed
          ),
        ),
      ),
         ),
        SizedBox(height: 5,),
        Container(
          width: 350,
        child: Text("    Password",),
        ),
        TextField(
          controller: paswordcontroller,
          decoration: InputDecoration(
        hintText: '   Enter your password',
          ),
        ),
        
              SizedBox(
                height: 20,),
                 ElevatedButton(
          onPressed: () {
        login();
          },
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFEB3738)),
          ),
          child: Text('Login'),
        ),
        TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
              },
              // style: Bu,
               child: Text("Create account!"
               ,style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
               ),
               )),
            // SizedBox(height: 5,),
            TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLogin()));
              }, child: Text("Admin_Login!",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
               ),
              
              )),
        ],
          ),
        ),
      ),
           
          ],
          
        ),
      ),
     );
  }
}