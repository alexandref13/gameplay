import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:mobx/mobx.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {
  final HomeModel homeModel = HomeModel();

  @observable
  String? title;
  @observable
  String? url;
  @observable
  String? description;
  @observable
  DocumentReference<Object?>? reference;

  @action
  deleteSchedule() {
    homeModel.delete(reference);
    Modular.to.pushReplacementNamed('/home');
  }
}
