import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:gameplay/app/modules/home/repositories/home_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository implements IHomeRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Stream<List<HomeModel>> getList() {
    return firestore
        .collection('games')
        .orderBy('position')
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        return HomeModel.fromDocument(e);
      }).toList();
    });
  }
}
