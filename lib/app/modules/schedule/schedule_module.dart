import 'package:gameplay/app/modules/schedule/schedule_Page.dart';
import 'package:gameplay/app/modules/schedule/schedule_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScheduleModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ScheduleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SchedulePage()),
  ];
}
