// AddManager.dart

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddManager extends StatefulWidget {
  @override
  _AddManagerState createState() => _AddManagerState();
}

class _AddManagerState extends State<AddManager> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  // Function to save data to Firestore
  Future<void> saveManagerData() async {
  final name = nameController.text;
  final area = areaController.text;
  final phoneNo = phoneNoController.text;

  if (name.isNotEmpty && area.isNotEmpty && phoneNo.isNotEmpty) {
    await firestore.collection('manager').add({
      'name': name,
      'area': area,
      'phoneNo': phoneNo,
    });

    if (mounted) {
      // Check if the widget is still mounted before popping
      Navigator.pop(context, {
        'name': name,
        'area': area,
        'phoneNo': phoneNo,
      });
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 50,
            child: ListTile(
              trailing: Container(
                width: 50,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: Color.fromARGB(220, 248, 242, 242),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: areaController,
                      decoration: InputDecoration(labelText: 'Area'),
                    ),
                    TextField(
                      controller: phoneNoController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        saveManagerData();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
