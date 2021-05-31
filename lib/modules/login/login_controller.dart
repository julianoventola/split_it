import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;

  LoginController({required this.onUpdate});

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      state = LoginStateLoading();
      onUpdate();
      await Future.delayed(Duration(seconds: 2));
      final response = await _googleSignIn.signIn();
      print(response);
      // to test failure: throw 'Failure on accessing Google account!';
      user = UserModel.google(response!);
      state = LoginStateSuccess(user: user!);
      onUpdate();
    } catch (error) {
      print('errorrrr: $error');
      state = LoginStateFailure(message: error.toString());
      onUpdate();
    }
  }
}
