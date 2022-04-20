// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TutorMobx on TutorBase, Store {
  final _$tutorListAtom = Atom(name: 'TutorBase.tutorList');

  @override
  ObservableList<Tutor> get tutorList {
    _$tutorListAtom.reportRead();
    return super.tutorList;
  }

  @override
  set tutorList(ObservableList<Tutor> value) {
    _$tutorListAtom.reportWrite(value, super.tutorList, () {
      super.tutorList = value;
    });
  }

  final _$initTutorsAsyncAction = AsyncAction('TutorBase.initTutors');

  @override
  Future<void> initTutors() {
    return _$initTutorsAsyncAction.run(() => super.initTutors());
  }

  @override
  String toString() {
    return '''
tutorList: ${tutorList}
    ''';
  }
}
