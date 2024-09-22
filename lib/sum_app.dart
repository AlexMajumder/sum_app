import 'package:flutter/material.dart';
import 'package:sum_app/home_screen.dart';

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    double _result = 0;
    return const MaterialApp(
      home: HomeScreeen(),
    );
  }
}
