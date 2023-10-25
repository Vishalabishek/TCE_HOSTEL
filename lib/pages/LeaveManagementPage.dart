import 'package:flutter/material.dart';

class LeaveManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Management'),
      ),  body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
Colors.blue,
              Colors.green,
               Color.fromARGB(255, 237, 235, 102),   // You can customize these colors
              Color.fromARGB(255, 226, 143, 79),   // Choose different color
            ],
          ),
        ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [ 
            Text(
              'Leave Management',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Leave Type'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Reason for Leave'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Leave Duration'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Contact Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to submit the leave request here
                // You can access the details entered by the hosteller in the TextFormField widgets.
              },
              child: Text('Submit Leave Request'),
            ),
          ],
        ),
      ),
    )
    );
  }

}