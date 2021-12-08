import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {
  @observable
  String? title;
  @observable
  String? url;
  @observable
  String? description;
  @observable
  DocumentReference<Object?>? reference;
}
