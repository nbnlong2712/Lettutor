import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/mobx/course_mobx.dart';
import 'package:flutter_lettutor/models/course.dart';
import 'package:flutter_lettutor/screens/course/courses/course_card.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/app_search_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<String> selectedList = [];
  CourseMobx courseMobx = CourseMobx();
  bool isShowIndicator = false;
  String queryStr = "";

  void openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      listData: Constant.Categories,
      enableOnlySingleSelection: true,
      hideSearchField: true,
      headlineText: "Courses",
      themeData: FilterListThemeData(context,
          choiceChipTheme: const ChoiceChipThemeData(selectedBackgroundColor: Colors.green),
          controlButtonBarTheme: ControlButtonBarThemeData(
              controlButtonTheme:
                  const ControlButtonThemeData(primaryButtonBackgroundColor: Colors.green, textStyle: TextStyle(color: Colors.green)))),
      selectedListData: selectedList,
      choiceChipLabel: (skill) => skill!,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (skill, query) {
        return skill.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedList = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  List<Course> filterCourses(){
    List<Course> courseFound = [];
    if (selectedList.isEmpty) {
      courseFound = courseMobx.courseList;
    } else {
      String subjectStr = selectedList[0].toLowerCase();
      for (Course course in courseMobx.courseList) {
        if (course.category!.toLowerCase().compareTo(subjectStr) == 0) {
          courseFound.add(course);
        }
      }
    }
    return courseFound;
  }

  List<Course> searchCourse(String query){
    List<Course> foundCourse = [];
    List<Course> courses = filterCourses();
    if (query.isEmpty) {
      return courses;
    } else {
      for (var course in courses) {
        if (course.name!.toLowerCase().contains(query.toLowerCase())) {
          foundCourse.add(course);
        }
      }
      return foundCourse;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTutorList();
  }

  void fetchTutorList() async {
    setState(() {
      isShowIndicator = true;
    });
    courseMobx.initCourses().then((_) {
      setState(() {
        isShowIndicator = false;
      });
    }).catchError((e) {
      setState(() {
        isShowIndicator = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isShowIndicator,
        child: SingleChildScrollView(
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.87,
                        child: AppSearchBar(
                          hint: "Search courses...",
                          onQueryChanged: (query) {
                            setState(() {
                              queryStr = query;
                            });
                          },
                        )),
                    GestureDetector(
                      child: const Icon(Icons.more_vert_sharp, color: Colors.black54, size: 30),
                      onTap: () {
                        openFilterDialog();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.67,
                  width: MediaQuery.of(context).size.width,
                  child: Observer(builder: (_) {
                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: searchCourse(queryStr).map((course) => CourseCard(course: course)).toList(),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
