// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$todoListAtom = Atom(name: '_HomeStoreBase.todoList');

  @override
  ObservableStream<List<HomeModel>>? get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableStream<List<HomeModel>>? value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$titleAtom = Atom(name: '_HomeStoreBase.title');

  @override
  TextEditingController get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(TextEditingController value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_HomeStoreBase.description');

  @override
  TextEditingController get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(TextEditingController value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$dayAtom = Atom(name: '_HomeStoreBase.day');

  @override
  TextEditingController get day {
    _$dayAtom.reportRead();
    return super.day;
  }

  @override
  set day(TextEditingController value) {
    _$dayAtom.reportWrite(value, super.day, () {
      super.day = value;
    });
  }

  final _$mouthAtom = Atom(name: '_HomeStoreBase.mouth');

  @override
  TextEditingController get mouth {
    _$mouthAtom.reportRead();
    return super.mouth;
  }

  @override
  set mouth(TextEditingController value) {
    _$mouthAtom.reportWrite(value, super.mouth, () {
      super.mouth = value;
    });
  }

  final _$hourAtom = Atom(name: '_HomeStoreBase.hour');

  @override
  TextEditingController get hour {
    _$hourAtom.reportRead();
    return super.hour;
  }

  @override
  set hour(TextEditingController value) {
    _$hourAtom.reportWrite(value, super.hour, () {
      super.hour = value;
    });
  }

  final _$minuteAtom = Atom(name: '_HomeStoreBase.minute');

  @override
  TextEditingController get minute {
    _$minuteAtom.reportRead();
    return super.minute;
  }

  @override
  set minute(TextEditingController value) {
    _$minuteAtom.reportWrite(value, super.minute, () {
      super.minute = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.getList');
    try {
      return super.getList();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${todoList},
title: ${title},
description: ${description},
day: ${day},
mouth: ${mouth},
hour: ${hour},
minute: ${minute}
    ''';
  }
}
