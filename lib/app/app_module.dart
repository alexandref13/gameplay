import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/home/home_module.dart';
import 'package:gameplay/app/shared/auth/auth_controller.dart';
import 'package:gameplay/app/shared/auth/repositories/auth_repository.dart';
import 'package:gameplay/app/shared/auth/repositories/auth_repository_interface.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
