import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Widget',
      home: ChangeNotifierProvider(
        create: (context) => MessageProvider(),
        child: SimpleWidget(),
      ),
    );
  }
}

class MessageProvider extends ChangeNotifier {
  String _message = "Selamat datang di politeknik sampit";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;

  Future<void> changeMessage() async {
    // Simulasi loading selama 3 detik
    await Future.delayed(Duration(seconds: 2));

    _message = "Terima kasih atas kunjungannya!";
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

class SimpleWidget extends StatelessWidget {
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
            Consumer<MessageProvider>(
              builder: (context, provider, child) {
                return Text(
                  provider.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                );
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Consumer<MessageProvider>(
                builder: (context, provider, child) {
                  return 
                      ElevatedButton.icon(
                        icon: provider.isLoading? 
                        Container(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(

                          ),
                        ):Icon(Icons.feedback),
                        onPressed: () async {
                          // Set loading true
                          provider.setLoading(true);
                          // Tunggu perubahan pesan
                          await Provider.of<MessageProvider>(context, listen: false).changeMessage();
                          // Set loading false
                          provider.setLoading(false);
                        },
                        label: Text('SUBMIT'),
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
