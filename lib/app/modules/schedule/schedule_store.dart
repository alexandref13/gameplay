import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:gameplay/app/modules/schedule/repository/schedule_repository.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStoreBase with _$ScheduleStore;

abstract class _ScheduleStoreBase with Store {
  final HomeStore homeStore = Modular.get();

  ImagePicker image = ImagePicker();
  @observable
  File? file;

  @observable
  String? url;

  @observable
  UploadTask? task;

  @action
  pickFile() async {
    final result = await image.pickImage(source: ImageSource.gallery);
    if (result != null) {
      file = File(result.path);

      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: file!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ),
      );
      if (croppedFile != null) {
        file = croppedFile;
      }
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
    } else {
      return '0';
    }
  }
}
