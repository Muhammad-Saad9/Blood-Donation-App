import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/admin/AddManager.dart';
import 'package:myapp/admin/admineditdonor.dart';
import 'package:myapp/mainscreens/donordetail.dart';

import 'Admin1stscreen.dart';

class AdminDonorListScreen extends StatefulWidget {
  @override
  _AdminDonorListScreenState createState() => _AdminDonorListScreenState();
}

class _AdminDonorListScreenState extends State<AdminDonorListScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> donorStream;

  @override
  void initState() {
    super.initState();
    donorStream = firestore.collection('donors').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor List',),
        actions: [
          Row(
            children:[
               IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayManagerData()));
            }, icon: Icon(Icons.manage_accounts)),
            ],
          ),
        ],
        backgroundColor: Color.fromARGB(255, 253, 0, 0),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: donorStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final donors = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: donors.length,
            itemBuilder: (context, index) {
              final donor = donors[index].data() as Map<String, dynamic>;
              final donorName = donor['name'];
              final location = donor['location'];
              final number = donor['number'];
              final bloodType = donor['bloodType'];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonorDetailScreen(
                        donorName: donorName,
                        location: location,
                        number: number,
                        bloodType: bloodType,
                      ),
                    ),
                  );
                },
                child: Column(
                  children:[ 
            
                    Container(
                    color: Color.fromARGB(255, 255, 230, 228),
                    child: ListTile(
                    title: Text("Name: $donorName"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location: $location"),
                        
                        Text("Number: $number"),
                        Text("Blood Type: $bloodType",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    ),
                        SizedBox(height: 5,)
                      ],
                    ),
                    trailing: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserScreen()));
                                        },style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                                        ), child: Text("Edit",
                                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                                        )),
                  ),
                              ),
                  ],
                ),);
            },
          );
        },
      ),
    );
  }
}
