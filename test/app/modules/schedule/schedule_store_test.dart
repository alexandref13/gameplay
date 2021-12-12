import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameplay/app/app_module.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:gameplay/app/modules/schedule/schedule_module.dart';
import 'package:gameplay/app/modules/schedule/schedule_store.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  late ScheduleStore store;

  initModules([ScheduleModule(), AppModule()]);

  setUpAll(() async {
    store = ScheduleStore();
    await Firebase.initializeApp();
  });

  test(
    'should be able to add a list',
    () async {
      final HomeStore homeStore = Modular.get();

      HomeModel? model;
      model ??= HomeModel();

      var date = '27/02 00:00';
      homeStore.title.text = 'Valorante';
      homeStore.description.text = 'Jogo de tiro';
      homeStore.day.text = '27';
      homeStore.mouth.text = '02';
      homeStore.hour.text = '00';
      homeStore.minute.text = '00';
      store.file = File(
        '/data/user/0/com.example.gameplay/cache/image_picker1249022730161477646.jpg',
      );

      await store.uploadFile();

      await model.save(
        title: homeStore.title.text,
        description: homeStore.description.text,
        date: date,
        url: store.url,
      );

      int newTotal = 1 + 1;

      expect(1, newTotal);
    },
  );
}
