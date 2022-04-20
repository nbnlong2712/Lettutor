// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CourseMobx on CourseBase, Store {
  final _$courseListAtom = Atom(name: 'CourseBase.courseList');

  @override
  ObservableList<Course> get courseList {
    _$courseListAtom.reportRead();
    return super.courseList;
  }

  @override
  set courseList(ObservableList<Course> value) {
    _$courseListAtom.reportWrite(value, super.courseList, () {
      super.courseList = value;
    });
  }

  final _$initCoursesAsyncAction = AsyncAction('CourseBase.initCourses');

  @override
  Future<void> initCourses() {
    return _$initCoursesAsyncAction.run(() => super.initCourses());
  }

  @override
  String toString() {
    return '''
courseList: ${courseList}
    ''';
  }
}
