import 'package:flutter/material.dart';

class DonorDetailScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Details'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(height: 200,),
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
            Text("Name: $donorName",
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),
            ),
            Text("Location: $location"
            ,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),),
            Text("Number: $number"
            ,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),),
            Text("Blood Type: $bloodType",
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),),
          ],
        ),
      ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
