import 'package:flutter/material.dart';
import 'HostellerProfilePage.dart';

class FavoriteMealsPage extends StatefulWidget {
  @override
  _FavoriteMealsPageState createState() => _FavoriteMealsPageState();
}


class _FavoriteMealsPageState extends State<FavoriteMealsPage> {
  final List<String> meals = [
    'Idli',
    'Vada',
    'Dosa',
    'Pongal',
    'Puri',
    'Chapathi',
    'Full Meals',
    'Mushroom Rice',
    'Veg Rice',
    'Idiyappam',
  ];

  final Map<String, int> mealVotes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Meals'),
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
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            final voteCount = mealVotes.containsKey(meal) ? mealVotes[meal] : 0;

            return ListTile(
              title: Text(meal),
              trailing: Text('$voteCount Votes'),
              onTap: () {
                setState(() {
                  mealVotes.update(meal, (value) => value + 1, ifAbsent: () => 1);
                });
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Hosteller Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostellerProfilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pop(context); // Go back to UserTypeSelectionPage
              },
            ),
          ],
        ),
      ),
    );
  }
}

