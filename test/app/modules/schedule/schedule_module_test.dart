import 'package:gameplay/app/modules/schedule/schedule_module.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    initModule(ScheduleModule());
  });
}
