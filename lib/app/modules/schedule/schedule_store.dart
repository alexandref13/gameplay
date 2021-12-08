import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:gameplay/app/modules/schedule/repository/schedule_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStoreBase with _$ScheduleStore;

abstract class _ScheduleStoreBase with Store {
  final HomeStore homeStore = Modular.get();

  @observable
  File? file;

  @observable
  String? url;

  @observable
  UploadTask? task;

  @observable
  String fileName = 'No File Selected';

  @action
  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result != null) {
      final path = result.files.single.path!;
      file = File(path);
      fileName = file != null ? basename(file!.path) : 'No File Selected';
    }
  }

  @action
  uploadFile() async {
    if (file != null) {
      final fileName = file!.path;
      final destination = 'files/$fileName';

      task = ScheduleRepository.uploadFile(destination, file!);

      if (task != null) {
        final snapshot = await task!.whenComplete(() {});
        url = await snapshot.ref.getDownloadURL();
        return url;
      }
    }
  }

  @action
  Future addList() async {
    HomeModel? model;
    model ??= HomeModel();

    var date =
        '${homeStore.day.text}/${homeStore.mouth.text} ${homeStore.hour.text}:${homeStore.minute.text}';

    await uploadFile();

    if (homeStore.title.text != '' ||
        homeStore.description.text != '' ||
        date != ' / :' ||
        file != null ||
        task != null) {
      await model.save(
        title: homeStore.title.text,
        description: homeStore.description.text,
        date: date,
        url: url,
      );

      homeStore.title.text = '';
      homeStore.description.text = '';
      homeStore.day.text = '';
      homeStore.mouth.text = '';
      homeStore.hour.text = '';
      homeStore.minute.text = '';

      Modular.to.pop();
    }
  }
}
