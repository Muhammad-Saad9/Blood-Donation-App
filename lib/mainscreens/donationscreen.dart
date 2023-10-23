import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/mainscreens/donordetail.dart';

class DonorListScreen extends StatefulWidget {
  @override
  _DonorListScreenState createState() => _DonorListScreenState();
}

class _DonorListScreenState extends State<DonorListScreen> {
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
                child: Container(
                  color: Color.fromARGB(255, 255, 230, 228),
                  child: ListTile(
                  title: Text("Name: $donorName"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location: $location"),
                      
                      Text("Number: $number"),
                      SizedBox(height: 5,)
                    ],
                  ),
                  trailing: Text("Blood Type: $bloodType",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  ),
                ),
              ),);
            },
          );
        },
      ),
    );
  }
}
