import 'package:gameplay/app/modules/home/home_Page.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/login/login_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
