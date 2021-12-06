import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  User? user;

  @action
  setUser(User value) => user = value;

  _AuthControllerBase() {
    _authRepository.getUser().then((value) {
      if (value != null) {
        setUser(value);
        Modular.to.pushReplacementNamed('/home/');
      }
    });
  }

  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
    Modular.to.pushReplacementNamed('/home/');
  }

  @action
  Future logOut() async {
    await _authRepository.getLogout();
    Modular.to.pushReplacementNamed('/');
  }
}
