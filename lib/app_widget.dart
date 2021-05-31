import 'package:flutter/material.dart';
import 'package:split_it/modules/splash/splash_page.dart';

import 'modules/error/error_page.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Split.it',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/error': (context) => ErrorPage(),
      },
    );
  }
}
