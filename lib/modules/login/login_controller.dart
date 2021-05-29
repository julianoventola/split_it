import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginController {
  UserModel? user;

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      print(response);
      user = UserModel.google(response!);
      print(user?.name);
    } catch (error) {
      print(error);
    }
  }
}
