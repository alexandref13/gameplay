import 'package:mobx/mobx.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStoreBase with _$ScheduleStore;
abstract class _ScheduleStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}