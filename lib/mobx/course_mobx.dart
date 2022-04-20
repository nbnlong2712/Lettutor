import 'package:flutter_lettutor/api/course_request.dart';
import 'package:flutter_lettutor/models/course.dart';
import 'package:mobx/mobx.dart';
part 'course_mobx.g.dart';

class CourseMobx = CourseBase with _$CourseMobx;
abstract class CourseBase with Store {

  @observable
  ObservableList<Course> courseList = ObservableList.of([]);

  @action
  Future<void> initCourses() async{
    await CourseRequest.fetchAllCourses().then((list) => courseList = ObservableList.of(list));
  }
}