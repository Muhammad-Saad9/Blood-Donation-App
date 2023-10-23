import 'package:flutter/material.dart';
import 'package:myapp/admin/Admin1stscreen.dart';
import 'package:myapp/admin/admindonor.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String Username = "Admin";
  String password = "1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            Container(
              width: double.infinity,
              height: 170,
              color: Colors.red,
              child: Image.asset("assets/Mask group.png"),
            ),
            Text("Login-AS-Admin",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(214, 255, 255, 255),
                border: Border.all(color: Colors.red,
                width: 2,
                )
              ),
            
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text == Username &&
                          passwordController.text == password) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDonorListScreen()));
                      }
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
