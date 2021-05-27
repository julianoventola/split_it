import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      Navigator.pushNamed(context, '/error');
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: AppTheme.gradients.background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SquaresSplashPage(
                rowAligment: MainAxisAlignment.start,
                firstChildSquare: Image.asset(
                  'assets/images/retangulo_esquerda.png',
                  width: 198,
                  height: 98,
                ),
                secondChildSquare: Image.asset(
                  'assets/images/retangulo_esquerda.png',
                  width: 114,
                  height: 58,
                ),
              ),
              Image.asset(
                'assets/images/Logo.png',
                width: 128,
                height: 112,
              ),
              SquaresSplashPage(
                rowAligment: MainAxisAlignment.end,
                firstChildSquare: Image.asset(
                  'assets/images/retangulo_direita.png',
                  width: 114,
                  height: 58,
                ),
                secondChildSquare: Image.asset(
                  'assets/images/retangulo_direita.png',
                  width: 198,
                  height: 98,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SquaresSplashPage extends StatelessWidget {
  final Image firstChildSquare;
  final Image secondChildSquare;
  final MainAxisAlignment rowAligment;

  const SquaresSplashPage({
    Key? key,
    required this.firstChildSquare,
    required this.secondChildSquare,
    required this.rowAligment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: rowAligment,
          children: [
            Opacity(
              opacity: 0.2,
              child: firstChildSquare,
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: rowAligment,
          children: [
            Opacity(
              opacity: 0.2,
              child: secondChildSquare,
            ),
          ],
        ),
      ],
    );
  }
}
