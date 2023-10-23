import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/loginScreen.dart';

class DisplayManagerData extends StatefulWidget {
  @override
  _DisplayManagerDataState createState() => _DisplayManagerDataState();
}

class _DisplayManagerDataState extends State<DisplayManagerData> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> managerStream;

  @override
  void initState() {
    super.initState();
    managerStream = firestore.collection('manager').snapshots();
  }

  void logout() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Manager Data'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              logout();
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: managerStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final managers = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: managers.length,
            itemBuilder: (context, index) {
              final manager = managers[index].data() as Map<String, dynamic>;
              final name = manager['name'];
              final area = manager['area'];
              final phoneNo = manager['phoneNo'];

              return Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: ListTile(
                  title: Text("Name: $name"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Area: $area"),
                      Text("Phone Number: $phoneNo"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
