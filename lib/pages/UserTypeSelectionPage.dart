import 'package:flutter/material.dart';
import 'HostellerLoginPage.dart';
import 'AdminLoginPage.dart';

class UserTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('userTypeSelectionPageKey'),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            FadeInImage(
              placeholder: AssetImage('assets/tcelogo.jpg'),
              image: AssetImage('assets/tcelogo.jpg'),
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'TCE Hostel App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigateToHostellerLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Text(
                        'Hosteller',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _navigateToAdminLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.admin_panel_settings),
                      SizedBox(width: 10),
                      Text(
                        'Administrator',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Welcome to the TCE Hostel App. Your one-stop solution for hostel management. Log in as a Hosteller or Administrator to get started.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHostellerLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HostellerLoginPage()),
    );
  }

  void _navigateToAdminLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminLoginPage()),
    );
  }
}

