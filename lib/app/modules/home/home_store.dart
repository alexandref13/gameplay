import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:gameplay/app/modules/home/repositories/home_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final IHomeRepository repository;

  @observable
  ObservableStream<List<HomeModel>>? todoList;

  _HomeStoreBase(IHomeRepository this.repository) {
    getList();
  }

  @action
  getList() {
    todoList = repository.getList().asObservable();
  }
}
