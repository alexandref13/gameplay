import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  AuthController auth = Modular.get();

  Future<void> loginWithGoogle() async {
    try {
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home');
    } catch (err) {}
  }
}
