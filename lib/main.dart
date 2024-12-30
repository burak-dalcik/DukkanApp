import 'package:flutter/material.dart';
import 'package:kirt_apideneme/screens/login.dart';
import 'package:kirt_apideneme/screens/sales_screen.dart';
import 'package:kirt_apideneme/screens/stok_takip_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stok Takip',
      debugShowCheckedModeBanner: false, // Debug banner kaldırıldı
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(), // İlk açılış ekranı Stok Takip
    );
  }
}
