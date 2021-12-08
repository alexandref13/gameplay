import 'package:gameplay/app/modules/home/home_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:gameplay/app/modules/home/repositories/home_repository_interface.dart';
import 'repositories/home_repository.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i.get())),
    Bind<IHomeRepository>((i) => HomeRepository()),
    Bind((i) => HomeStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
