import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/AdminLogin.dart';
import 'package:myapp/admin/adminadddonor.dart';
import 'package:myapp/mainscreens/donationscreen.dart';

class register extends StatefulWidget {
  register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddDonorScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
  //       appBar:
  //       // PreferredSize(
  // // // preferredSize: Size.fromHeight(220.0),
  
  //  AppBar(
  //     backgroundColor: Color.fromARGB(255, 187, 45, 45),
  //   ),

         
      // backgroundColor:  Color.fromARGB(255, 228, 47, 15),
   SingleChildScrollView(
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
          controller: passwordcontroller,
          decoration: InputDecoration(
        hintText: '   Enter your password',
          ),
        ),
        
              SizedBox(
                height: 20,),
                 ElevatedButton(
          onPressed: () {
        register();
          },
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFEB3738)),
          ),
          child: Text('Sign-Up'),
        ),
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