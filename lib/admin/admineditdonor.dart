import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditUserScreen extends StatefulWidget {
  final String? userId;
  final String? initialName;
  final String? initialLocation;
  final String? initialPhoneNumber;
  final String? initialBloodGroup;

  EditUserScreen({
    this.userId,
    this.initialName,
    this.initialLocation,
    this.initialPhoneNumber,
    this.initialBloodGroup,
  });

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.initialName ?? '';
    locationController.text = widget.initialLocation ?? '';
    phoneNumberController.text = widget.initialPhoneNumber ?? '';
    bloodGroupController.text = widget.initialBloodGroup ?? '';
  }

 void updateUser() {
  if (widget.userId != null) {
    users.doc(widget.userId).update({
      'name': nameController.text,
      'location': locationController.text,
      'phoneNumber': phoneNumberController.text,
      'bloodGroup': bloodGroupController.text,
    }).then((_) {
      // Update successful, you can close the edit screen
      Navigator.of(context).pop();
    }).catchError((error) {
      // Handle errors
      print("Failed to update user: $error");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to update user data. Please try again later."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: bloodGroupController,
              decoration: InputDecoration(labelText: 'Blood Group'),
            ),
            ElevatedButton(
              onPressed: updateUser,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
