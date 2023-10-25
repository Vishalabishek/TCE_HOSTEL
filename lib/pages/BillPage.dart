import 'package:flutter/material.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hosteller Information:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: roomNumberController,
              decoration: InputDecoration(labelText: 'Room Number'),
            ),
            TextFormField(
              controller: regNumberController,
              decoration: InputDecoration(labelText: 'Registration Number'),
            ),
            SizedBox(height: 20),
            Text('Billing Details:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Room Rent: Rs $roomRent'),
            Text('Laundry: Rs $laundryCharge'),
            Text('Food: Rs $foodCharge'),
            Text('Other Services: Rs $otherServicesCharge'),
            Text('Total Bill Amount: Rs $totalBill', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),


            SizedBox(height: 20),
            Text('Payment Options:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            
           
             SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Implement cash payment logic here
              },
              child: Text('Pay with Cash'),
            ), 
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Implement card payment logic here
              },
              child: Text('Pay with Card'),
            ), 
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Implement online payment logic here
              },
              child: Text('Pay Online'),
            ),],
       ),
     ),
     ), );
  }
} 