import 'package:flutter/material.dart';
import 'package:tcehostel/pages/HostellerLoginPage.dart';
import 'FavoriteMealsPage.dart';
import 'IssueReportingPage.dart';
import 'BillPage.dart';
import 'LeaveManagementPage.dart';
import 'HostelStorePage.dart';

class HostellerProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T C E  H O S T E L  A P P'),
        backgroundColor: Colors.blue, // Set the app bar color to blue
      ),
      backgroundColor: Colors.orange,
      body: GridView.count(
        crossAxisCount: 2, // Number of columns
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildMenuItem(context, 'Favorite Meals', Icons.restaurant_menu, Colors.blue, FavoriteMealsPage(), 'assets/favourite_meals.jpg'),
          _buildMenuItem(context, 'Report an Issue', Icons.report_problem, Colors.blue, IssueReportingPage(), 'assets/issue.jpg'),
          _buildMenuItem(context, 'Leave Management', Icons.date_range, Colors.blue, LeaveManagementPage(), 'assets/leave.jpg'),
          _buildMenuItem(context, 'Bill', Icons.money, Colors.blue, BillPage(), 'assets/bill.jpg'),
          _buildMenuItem(context, 'Store', Icons.logout, Colors.blue, HostelStorePage(), 'assets/store.jpg'), // Set onTap as null for Logout
        ],
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
    );
  }

  Widget _buildMenuItem(BuildContext context, String label, IconData icon, Color color, Widget page, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          // Handle Logout logic here
        }
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 40,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 20, // Set the font size to 20
                fontWeight: FontWeight.bold, // Set the font weight to bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}





