// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStoreBase, Store {
  final _$valueAtom = Atom(name: '_ScheduleStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ScheduleStoreBaseActionController =
      ActionController(name: '_ScheduleStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_ScheduleStoreBaseActionController.startAction(
        name: '_ScheduleStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
