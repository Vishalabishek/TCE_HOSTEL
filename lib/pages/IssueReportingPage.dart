import 'package:flutter/material.dart';

class IssueReportingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report an Issue'),
      ),body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ 
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
              'Report an Issue',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Issue Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to submit the issue report here
                // You can access the issue description using the controller or the text entered in the TextFormField.
              },
              child: Text('Submit Issue Report'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}