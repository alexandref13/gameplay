import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:gameplay/app/modules/schedule/repository/schedule_repository_interface.dart';

class ScheduleRepository implements IScheduleRepository {
  static UploadTask? uploadFile(String destination, File file) {
    final ref = FirebaseStorage.instance.ref(destination);

    return ref.putFile(file);
  }
}
