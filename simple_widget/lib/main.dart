import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Widget',
      home: SimpleWidget(),
    );
  }
}

class SimpleWidget extends StatefulWidget {
  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget> {
  String _message = "Selamat datang di politeknik sampit";

  void _changeMessage() {
    setState(() {
      _message = "Terima kasih atas kunjungannya!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'UTS PENGEMBANGAN APLIKASI MOBILE',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                  "images/logo.png",
                  height: 200,
                  width: 200,
                ),
            SizedBox(height: 200,),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang
                borderRadius: BorderRadius.circular(10.0), // Bentuk persegi panjang
                border: Border.all(color: Colors.grey), // Border berwarna abu
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Warna shadow
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Posisi shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _changeMessage,
                child: Text('SUBMIT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
