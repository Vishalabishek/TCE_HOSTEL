import 'package:flutter/material.dart';
import 'package:tcehostel/pages/HostellerProfilePage.dart';
import 'HostellerLoginPage.dart';
import 'IssueReportingPage.dart';
import 'BillPage.dart';
import 'LeaveManagementPage.dart';
import 'HostelStorePage.dart';

class FavoriteMealsPage extends StatefulWidget {
  @override
  _FavoriteMealsPageState createState() => _FavoriteMealsPageState();
}

class _FavoriteMealsPageState extends State<FavoriteMealsPage> {
  final List<Map<String, dynamic>> meals = [
    {'name': 'Idli', 'image': 'assets/idli.jpg'},
    {'name': 'Vada', 'image': 'assets/vada.jpg'},
    {'name': 'Dosa', 'image': 'assets/dosa.jpg'},
    {'name': 'Pongal', 'image': 'assets/pongal.jpg'},
    {'name': 'Puri', 'image': 'assets/puri.jpg'},
    {'name': 'Chapathi', 'image': 'assets/chapathi.jpg'},
    {'name': 'Full Meals', 'image': 'assets/full_meals.jpg'},
    {'name': 'Mushroom Rice', 'image': 'assets/mushroom_rice.jpg'},
    {'name': 'Veg Rice', 'image': 'assets/veg_rice.jpg'},
    {'name': 'Parotta', 'image': 'assets/parotta.jpg'},
  ];

  final Map<String, int> mealVotes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Meals'),
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
              Color.fromARGB(255, 237, 235, 102),
              Color.fromARGB(255, 226, 143, 79),
            ],
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            final voteCount = mealVotes.containsKey(meal['name']) ? mealVotes[meal['name']] : 0;

            return GestureDetector(
              onTap: () {
                setState(() {
                  mealVotes.update(meal['name'], (value) => value + 1, ifAbsent: () => 1);
                });
              },
              child: Card(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset(meal['image'], width: 100, height: 100),
                    Text(meal['name']),
                    Text('$voteCount Votes'),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mealVotes.update(meal['name'], (value) => value + 1, ifAbsent: () => 1);
                        });
                      },
                      child: Text('Vote'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      
    );
  }
}
