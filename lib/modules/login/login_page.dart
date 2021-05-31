import 'package:flutter/material.dart';
import 'package:split_it/modules/login/login_state.dart';

import 'package:split_it/modules/login/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = LoginController(onUpdate: () {
      if (controller.state is LoginStateSuccess) {
        final user = (controller.state as LoginStateSuccess).user;
        Navigator.pushReplacementNamed(context, '/home', arguments: user);
      }
      setState(() {});
    });
  }

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
              // ternary: check login state to return Widget
              (controller.state is LoginStateLoading)
                  ? CircularProgressIndicator()
                  : (controller.state is LoginStateFailure)
                      ? Text((controller.state as LoginStateFailure).message)
                      : SocialButtonWidget(
                          label: 'Entrar com Google',
                          iconPath: 'assets/images/google-icon.png',
                          onTap: () async {
                            await controller.googleSignIn();
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
