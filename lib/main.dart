import 'package:flutter/material.dart';
import 'package:wimtorq/sreens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
