// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStoreBase, Store {
  final _$fileAtom = Atom(name: '_ScheduleStoreBase.file');

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$urlAtom = Atom(name: '_ScheduleStoreBase.url');

  @override
  String? get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String? value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  final _$taskAtom = Atom(name: '_ScheduleStoreBase.task');

  @override
  UploadTask? get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(UploadTask? value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  final _$pickFileAsyncAction = AsyncAction('_ScheduleStoreBase.pickFile');

  @override
  Future pickFile() {
    return _$pickFileAsyncAction.run(() => super.pickFile());
  }

  final _$uploadFileAsyncAction = AsyncAction('_ScheduleStoreBase.uploadFile');

  @override
  Future uploadFile() {
    return _$uploadFileAsyncAction.run(() => super.uploadFile());
  }

  final _$addListAsyncAction = AsyncAction('_ScheduleStoreBase.addList');

  @override
  Future<dynamic> addList() {
    return _$addListAsyncAction.run(() => super.addList());
  }

  @override
  String toString() {
    return '''
file: ${file},
url: ${url},
task: ${task}
    ''';
  }
}
