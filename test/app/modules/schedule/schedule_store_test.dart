import 'package:flutter_test/flutter_test.dart';
import 'package:gameplay/app/modules/schedule/schedule_store.dart';
 
void main() {
  late ScheduleStore store;

  setUpAll(() {
    store = ScheduleStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}