import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                margin: EdgeInsets.only(left: 40),
                width: 236,
                child: Text(
                  'Divida suas contas com seus amigos',
                  style: AppTheme.textStyle.title,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Image.asset(
                    'assets/images/emoji.png',
                    width: 36,
                  ),
                  title: Text(
                    'Faça seu login com uma das contas abaixo',
                    style: AppTheme.textStyle.button,
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SocialButtonWidget(
                label: 'Entrar com Google',
                iconPath: 'assets/images/google-icon.png',
                onTap: () async {
                  GoogleSignIn _googleSignIn = GoogleSignIn(
                    scopes: [
                      'email',
                    ],
                  );

                  try {
                    final response = await _googleSignIn.signIn();
                    print(response);
                  } catch (error) {
                    print(error);
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              SocialButtonWidget(
                label: 'Entrar com Apple',
                iconPath: 'assets/images/apple-icon.png',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
