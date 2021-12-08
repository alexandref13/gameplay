import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final authController = Modular.get<AuthController>();

  @action
  getPage() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (authController.status == AuthStatus.login) {
          Modular.to.pushReplacementNamed('/home/');
        } else if (authController.status == AuthStatus.logoff) {
          Modular.to.pushReplacementNamed('/login/');
        }
      },
    );
  }
}
