import 'package:flutter/material.dart';
import 'package:tcehostel/pages/HostellerLoginPage.dart';
import 'package:tcehostel/pages/HostellerProfilePage.dart';
import 'IssueReportingPage.dart';
import 'FavoriteMealsPage.dart';
import 'LeaveManagementPage.dart';
import 'HostelStorePage.dart';

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController regNumberController = TextEditingController();

  int roomRent = 50000;
  int laundryCharge = 1000;
  int foodCharge = 20000;
  int otherServicesCharge = 10000;

  int totalBill = 0;
  bool showBill = false;

  void calculateTotalBill() {
    totalBill = roomRent + laundryCharge + foodCharge + otherServicesCharge;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Details'),
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
              Color.fromARGB(255, 255, 132, 0), // Light Blue
               // Light Orange
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hosteller Information:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildInfoTextField(nameController, 'Name'),
              SizedBox(height: 10),
              buildInfoTextField(roomNumberController, 'Room Number'),
              SizedBox(height: 10),
              buildInfoTextField(regNumberController, 'Registration Number'),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showBill = true;
                      calculateTotalBill();
                    });
                  },
                  child: Text('Calculate Bill'),
                ),
              ),
              if (showBill)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Billing Details:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    buildDetailRow('Room Rent', roomRent),
                    buildDetailRow('Laundry', laundryCharge),
                    buildDetailRow('Food', foodCharge),
                    buildDetailRow('Other Services', otherServicesCharge),
                    buildTotalBillRow('Total Bill Amount', totalBill),
                    SizedBox(height: 20),
                    Text(
                      'Payment Options:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    buildPaymentButton('Pay with Cash', Icons.money, () {
                      // Implement cash payment logic here
                    }),
                    SizedBox(height: 10),
                    buildPaymentButton('Pay with Card', Icons.credit_card, () {
                      // Implement card payment logic here
                    }),
                    SizedBox(height: 10),
                    buildPaymentButton('Pay Online', Icons.payment, () {
                      // Implement online payment logic here
                    }),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget buildDetailRow(String title, int amount) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text('Rs $amount', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildTotalBillRow(String title, int amount) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('Rs $amount', style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildPaymentButton(String title, IconData icon, void Function() onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController regNumberController = TextEditingController();

  int roomRent = 50000;
  int laundryCharge = 1000;
  int foodCharge = 20000;
  int otherServicesCharge = 10000;

  int totalBill = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalBill();
  }

  void calculateTotalBill() {
    totalBill = roomRent + laundryCharge + foodCharge + otherServicesCharge;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255), // Light Blue
              Color.fromARGB(255, 255, 255, 255), // Light Orange
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hosteller Information:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildInfoTextField(nameController, 'Name'),
              SizedBox(height: 20),
              buildInfoTextField(roomNumberController, 'Room Number'),
              SizedBox(height: 20),
              buildInfoTextField(regNumberController, 'Registration Number'),
              SizedBox(height: 20),
              Text(
                'Billing Details:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              buildDetailRow('Room Rent', roomRent),
              buildDetailRow('Laundry', laundryCharge),
              buildDetailRow('Food', foodCharge),
              buildDetailRow('Other Services', otherServicesCharge),
              buildTotalBillRow('Total Bill Amount', totalBill),
              SizedBox(height: 20),
              Text(
                'Payment Options:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildPaymentButton('Pay with Cash', Icons.money, () {
                // Implement cash payment logic here
              }),
              SizedBox(height: 10),
              buildPaymentButton('Pay with Card', Icons.credit_card, () {
                // Implement card payment logic here
              }),
              SizedBox(height: 10),
              buildPaymentButton('Pay Online', Icons.payment, () {
                // Implement online payment logic here
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget buildDetailRow(String title, int amount) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text('Rs $amount', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildTotalBillRow(String title, int amount) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('Rs $amount', style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildPaymentButton(String title, IconData icon, void Function() onPressed) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: Icon(icon),
    label: Text(title),
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
      onPrimary: Colors.white,
      minimumSize: Size(double.infinity, 50),
    ),
  );
}

}
*/