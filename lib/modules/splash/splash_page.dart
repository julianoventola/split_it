import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: AppTheme.gradients.background,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/Logo.png',
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
      ),
    );
  }
}
