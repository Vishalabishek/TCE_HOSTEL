import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'BillPage.dart';
import 'FavoriteMealsPage.dart';
import 'IssueReportingPage.dart';
import 'HostellerLoginPage.dart';
import 'HostellerProfilePage.dart';
import 'HostelStorePage.dart';

class LeaveManagementPage extends StatefulWidget {
  @override
  _LeaveManagementPageState createState() => _LeaveManagementPageState();
}

class _LeaveManagementPageState extends State<LeaveManagementPage> {
  TextEditingController leaveTypeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );

  if (picked != null) {
    setState(() {
      durationController.text = DateFormat('MM/dd/yyyy').format(picked);
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Management'),
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
              const Color.fromARGB(255, 255, 140, 0),
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
                controller: leaveTypeController,
                decoration: InputDecoration(labelText: 'Leave Type'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: reasonController,
                decoration: InputDecoration(labelText: 'Reason for Leave'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: durationController,
                decoration: InputDecoration(
                  labelText: 'Leave Duration',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement the logic to submit the leave request here
                  // You can access the details entered by the hosteller in the TextFormField widgets.
                  _showConfirmationDialog();
                },
                child: Text('Submit Leave Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Leave Request Submitted'),
          content: Text('Your leave request has been submitted successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

