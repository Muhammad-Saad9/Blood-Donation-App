import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/mainscreens/donationscreen.dart';

class AddDonorScreen extends StatefulWidget {
  const AddDonorScreen({Key? key}) : super(key: key);

  @override
  _AddDonorScreenState createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  String selectedBloodType = "A+"; // Default blood type

  void addDonor() {
    final String name = nameController.text;
    final String location = locationController.text;
    final String number = numberController.text;
    final String bloodType = selectedBloodType;

    if (!mounted) {
      // Check if the widget is still mounted
      return;
    }

    if (name.isNotEmpty && bloodType.isNotEmpty) {
      firestore.collection('donors').add({
        'name': name,
        'location': location,
        'number': number,
        'bloodType': bloodType,
      }).then((value) {
        print('Donor added with ID: ${value.id}');
        
        if (!mounted) {
          // Check if the widget is still mounted before navigating
          return;
        }
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DonorListScreen()));
      }).catchError((error) {
        print('Error adding donor: $error');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Both name and blood type are required.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> bloodTypes = [
      "A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Donor'),
        backgroundColor: Color(0xFFEB3738),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
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
                  controller: numberController,
                  decoration: InputDecoration(labelText: 'Phone-Number'),
                ),
                // Dropdown to select blood type
                DropdownButton<String>(
                  value: selectedBloodType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBloodType = newValue!;
                    });
                  },
                  items: bloodTypes.map((String bloodType) {
                    return DropdownMenuItem<String>(
                      value: bloodType,
                      child: Text(bloodType),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    addDonor();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DonorListScreen()));                  },
                  child: Text('Add Donor'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
