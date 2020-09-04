import 'package:flutter/material.dart';
import 'package:mobiletest/views/home_view.dart';
import 'package:mobiletest/views/login_view.dart';
import 'package:mobiletest/views/register_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/home' : (context) => HomeView(),
        '/login' : (context) => LoginView(),
        '/register' : (context) => RegisterView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
