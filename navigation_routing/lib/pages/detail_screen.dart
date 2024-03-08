import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String biodata;

  DetailScreen({required this.name, required this.biodata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kembali'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
              child: Text(
                name[0],
                style: TextStyle(fontSize: 36.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              biodata,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
