import 'package:gameplay/app/modules/login/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final UserModel user;
  @observable
  String name = '';

  @observable
  String photoUrl = '';

  _HomeStoreBase(this.user) {
    name = '';
  }
}
