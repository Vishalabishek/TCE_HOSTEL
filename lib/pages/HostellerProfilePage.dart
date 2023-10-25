// ignore_for_file: file_names, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'FavoriteMealsPage.dart';
import 'IssueReportingPage.dart';
import 'BillPage.dart';
import 'LeaveManagementPage.dart';

class HostellerProfilePage extends StatefulWidget {
  @override
  _HostellerProfilePageState createState() => _HostellerProfilePageState();
}

class _HostellerProfilePageState extends State<HostellerProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController roomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hosteller Profile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 149, 255),
              ),
              accountName: Text('Vishal Abishek G'),
              accountEmail: Text('vishalabishek@student.tce.edu'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('Favorite Meals'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoriteMealsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.report_problem),
              title: Text('Report an Issue'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IssueReportingPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Leave Management'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveManagementPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Bill'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BillPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 80,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: 'Contact Details',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: roomController,
              decoration: InputDecoration(
                labelText: 'Room Number',
                prefixIcon: Icon(Icons.room),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement profile update logic here
                // You can access the values entered by the user using nameController.text,
                // contactController.text, and roomController.text
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Update Profile',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}