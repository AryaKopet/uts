import 'package:flutter/material.dart';
import './pages/home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Routing',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomeScreen(),
  ));
}
