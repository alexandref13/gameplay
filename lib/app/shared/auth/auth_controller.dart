import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  User? user;

  @action
  getUser() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? newUser) {
        if (newUser == null) {
          status = AuthStatus.logoff;
        } else {
          user = newUser;
          status = AuthStatus.login;
        }
      },
    );
  }

  _AuthControllerBase() {
    getUser();
  }

  @action
  Future loginWithGoogle() async {
    status = AuthStatus.loading;
    user = await _authRepository.getGoogleLogin();
    Modular.to.pushReplacementNamed('/home/');
    status = AuthStatus.login;
  }

  @action
  Future logOut() async {
    await _authRepository.getLogout();
    Modular.to.pushReplacementNamed('/login/');
  }
}

enum AuthStatus {
  loading,
  login,
  logoff,
}
