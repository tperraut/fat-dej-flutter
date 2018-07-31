import 'package:flutter/material.dart';
import 'package:fatdej/src/ui/login_page.dart';

class FatDejApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange
      ),
    );
  }
}