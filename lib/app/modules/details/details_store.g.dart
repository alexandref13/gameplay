// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsStore on _DetailsStoreBase, Store {
  final _$titleAtom = Atom(name: '_DetailsStoreBase.title');

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$urlAtom = Atom(name: '_DetailsStoreBase.url');

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

  final _$descriptionAtom = Atom(name: '_DetailsStoreBase.description');

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$referenceAtom = Atom(name: '_DetailsStoreBase.reference');

  @override
  DocumentReference<Object?>? get reference {
    _$referenceAtom.reportRead();
    return super.reference;
  }

  @override
  set reference(DocumentReference<Object?>? value) {
    _$referenceAtom.reportWrite(value, super.reference, () {
      super.reference = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
url: ${url},
description: ${description},
reference: ${reference}
    ''';
  }
}
