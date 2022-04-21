import 'package:flutter/material.dart';
import 'package:tugas_3/feature/page_detail_countries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageDetailCountries(),
    );
  }
}