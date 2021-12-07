import 'package:gameplay/app/modules/home/models/home_model.dart';

abstract class IHomeRepository {
  Stream<List<HomeModel>> getList();
}
