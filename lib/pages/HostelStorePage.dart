import 'package:flutter/material.dart';
import 'package:tcehostel/pages/HostellerLoginPage.dart';
import 'FavoriteMealsPage.dart';
import 'IssueReportingPage.dart';
import 'BillPage.dart';
import 'LeaveManagementPage.dart';

class HostelStorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel Store'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Hostel Store Page!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Opening Hours:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Monday to Friday: 9:00 PM -12:00 AM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Saturday: 8:30 AM - 12:00 AM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Sunday: Closed',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
