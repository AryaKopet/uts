import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Widget',
      home: ChangeNotifierProvider( // Gunakan ChangeNotifierProvider
        create: (context) => MessageProvider(), // Buat instance dari MessageProvider
        child: SimpleWidget(),
      ),
    );
  }
}

// Buat class yang akan bertindak sebagai penyedia (provider)
class MessageProvider extends ChangeNotifier {
  String _message = "Selamat datang di politeknik sampit";

  // Getter untuk mendapatkan pesan
  String get message => _message;

  // Method untuk mengubah pesan
  void changeMessage() {
    _message = "Terima kasih atas kunjungannya!";
    // Memberitahu semua listener bahwa data telah berubah
    notifyListeners();
  }
}

class SimpleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Gunakan Consumer untuk mendengarkan perubahan pada MessageProvider
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
            // Gunakan Consumer untuk mendengarkan perubahan pada MessageProvider
            Consumer<MessageProvider>(
              builder: (context, provider, child) {
                return Text(
                  provider.message, // Ambil pesan dari provider
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                );
              },
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
                onPressed: () {
                  // Ambil instance dari MessageProvider
                  MessageProvider provider = Provider.of<MessageProvider>(context, listen: false);
                  provider.changeMessage(); // Ubah pesan menggunakan provider
                },
                child: Text('SUBMIT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
