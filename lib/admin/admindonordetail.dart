import 'package:flutter/material.dart';
import 'package:myapp/admin/Admin1stscreen.dart';
import 'package:myapp/admin/admineditdonor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorDetailScreen extends StatefulWidget {
  final String donorName;
  final String location;
  final String number;
  final String bloodType;

  DonorDetailScreen({
    required this.donorName,
    required this.location,
    required this.number,
    required this.bloodType,
  });

  @override
  _DonorDetailScreenState createState() => _DonorDetailScreenState();
}

class _DonorDetailScreenState extends State<DonorDetailScreen> {
  CollectionReference donors = FirebaseFirestore.instance.collection('donors');
  TextEditingController donorNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    donorNameController.text = widget.donorName;
    locationController.text = widget.location;
    numberController.text = widget.number;
    bloodTypeController.text = widget.bloodType;
  }

  void updateDonor() {
    donors
        .doc('your_document_id') // Replace with the actual document ID
        .update({
          'name': donorNameController.text,
          'location': locationController.text,
          'number': numberController.text,
          'bloodType': bloodTypeController.text,
        })
        .then((value) {
          // Update successful
          Navigator.of(context).pop(); // Close the edit dialog
        })
        .catchError((error) {
          // Handle errors
          print("Failed to update donor: $error");
        });
  }

  void openEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Donor Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: donorNameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              TextField(
                controller: numberController,
                decoration: InputDecoration(labelText: 'Number'),
              ),
              TextField(
                controller: bloodTypeController,
                decoration: InputDecoration(labelText: 'Blood Type'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                // Call the updateDonor function to save the edits
                updateDonor();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Details'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        children: [
          SizedBox(height: 200),
          Center(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 161, 158, 158),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${widget.donorName}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Location: ${widget.location}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Number: ${widget.number}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Blood Type: ${widget.bloodType}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ),
                ElevatedButton(onPressed: (){
                
                }, child: Text("call")),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Open the Edit Donor dialog
                openEditDialog(context);
              },
              child: Text("Edit"),
            ),
          ],
        ),
      ),
    );
  }
}
