import 'package:flutter/cupertino.dart';

import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  LoginService loginService;
  Function(LoginState state)? onChange;

  LoginController({
    this.user,
    required this.onUpdate,
    required this.loginService,
  });

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      await Future.delayed(Duration(seconds: 2));
      // to test failure: throw 'Failure on accessing Google account!';
      final user = await loginService.googleSignIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      print('errorrrr: $error');
      state = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
