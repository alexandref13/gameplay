import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:mobx/mobx.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStoreBase with _$ScheduleStore;

abstract class _ScheduleStoreBase with Store {
  final HomeStore homeStore = Modular.get();

  @action
  Future addList() async {
    HomeModel? model;
    model ??= HomeModel();

    var date =
        '${homeStore.day.text}/${homeStore.mouth.text} ${homeStore.hour.text}:${homeStore.minute.text}';

    await model.save(homeStore.title.text, homeStore.description.text, date);

    homeStore.title.text = '';
    homeStore.description.text = '';
    homeStore.day.text = '';
    homeStore.mouth.text = '';
    homeStore.hour.text = '';
    homeStore.minute.text = '';

    Modular.to.pop();
  }
}
