import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quirky/core/constants/theme.dart';
import 'package:quirky/view/home_view/screen/home_screen.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: quirkyTheme,
      debugShowCheckedModeBanner: false,
      title: 'Quirky',
      home: HomeScreen(),
    );
  }
}
