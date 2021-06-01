import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/login/login_controller.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginServiceMock extends Mock implements LoginService {
  // @override
  // Future<UserModel> googleSignIn() async {
  //   return UserModel(
  //     id: 'id',
  //     email: 'mockemail@email.com',
  //     name: 'mock',
  //     photoUrl: 'photo',
  //   );
  // }
}

void main() {
  late LoginController loginController;
  late LoginService loginService;

  setUp(() {
    loginService = LoginServiceMock();

    loginController = LoginController(
      loginService: loginService,
      onUpdate: () {},
    );
  });

  test('Google SignIn - Success', () async {
    expect(loginController.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    loginController.listen((state) => states.add(state));

    when(loginService.googleSignIn).thenAnswer((invocation) async {
      return UserModel(
        id: 'id',
        email: 'mockemail@email.com',
        name: 'mock',
        photoUrl: 'photo',
      );
    });

    await loginController.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });

  test('Google SignIn - Failure', () async {
    expect(loginController.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    loginController.listen((state) => states.add(state));
    when(loginService.googleSignIn).thenThrow('Error was not able to login');
    await loginController.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((loginController.state as LoginStateFailure).message,
        'Error was not able to login');
    expect(states.length, 2);
  });

  test('Login Controller listen() - update listen', () async {
    loginController.state = LoginStateLoading();
    loginController
        .listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    loginController.update();
  });

  test('Login Controller update() - update listen', () async {
    loginController.state = LoginStateLoading();
    loginController
        .listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    loginController.update();
  });
}
