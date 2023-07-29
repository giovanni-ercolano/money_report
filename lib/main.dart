import 'package:flutter/material.dart';
import 'package:money_report/screens/home.dart';
import 'package:money_report/styles/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(backgroundColor: AppColor.primaryCyan)
        ),
        
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
        });
  }
}
