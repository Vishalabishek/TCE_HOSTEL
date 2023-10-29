import 'package:flutter/material.dart';
import 'BillPage.dart';
import 'FavoriteMealsPage.dart';
import 'LeaveManagementPage.dart';
import 'HostellerLoginPage.dart';
import 'HostellerProfilePage.dart';
import 'HostelStorePage.dart';

class IssueReportingPage extends StatefulWidget {
  @override
  _IssueReportingPageState createState() => _IssueReportingPageState();
}

class _IssueReportingPageState extends State<IssueReportingPage> {
  final _issueDescriptionController = TextEditingController();
  bool _issueSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report an Issue'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Set the drawer header color to blue
              ),
              accountName: Text('Vishal Abishek G'),
              accountEmail: Text('vishalabishek@student.tce.edu'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue), // Set icon color to blue
              title: Text('Home', style: TextStyle(color: Colors.blue)), // Set label color to blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostellerProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu, color: Colors.blue), // Set icon color to blue
              title: Text('Favorite Meals', style: TextStyle(color: Colors.blue)), // Set label color to blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoriteMealsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.report_problem, color: Colors.blue), // Set icon color to blue
              title: Text('Report an Issue', style: TextStyle(color: Colors.blue)), // Set label color to blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IssueReportingPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range, color: Colors.blue), // Set icon color to blue
              title: Text('Leave Management', style: TextStyle(color: Colors.blue)), // Set label color to blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveManagementPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money, color: Colors.blue), // Set icon color to blue
              title: Text('Bill', style: TextStyle(color: Colors.blue)), // Set label color to blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BillPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.store, color: Colors.blue), // Set icon color to blue
              title: Text('Store', style: TextStyle(color: Colors.blue)), // Set label color to blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostelStorePage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.blue), // Set icon color to blue
              title: Text('Logout', style: TextStyle(color: Colors.blue)), // Set label color to blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostellerLoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 140, 0),
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
                controller: _issueDescriptionController,
                decoration: InputDecoration(labelText: 'Issue Description'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final issueDescription = _issueDescriptionController.text;
                  if (issueDescription.isNotEmpty) {
                    // Implement issue submission logic here
                    // For demonstration purposes, we'll simply set a flag for successful submission.
                    // You can replace this with your actual submission logic.
                    setState(() {
                      _issueSubmitted = true;
                    });
                    // Show a confirmation dialog on successful submission
                    _showConfirmationDialog();
                  }
                },
                child: Text('Submit Issue Report'),
              ),
              if (_issueSubmitted)
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Issue Report Submitted!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Your issue report has been submitted successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog and reset the form
                Navigator.of(context).pop();
                setState(() {
                  _issueDescriptionController.clear();
                  _issueSubmitted = false;
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


