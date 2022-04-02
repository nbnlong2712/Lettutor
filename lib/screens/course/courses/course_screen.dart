import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/course.dart';
import 'package:flutter_lettutor/screens/course/courses/course_card.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/app_search_bar.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<String> selectedUserList = [];
  List<Course> courseList = [];

  void openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      listData: skills,
      enableOnlySingleSelection: true,
      hideSearchField: true,
      themeData: FilterListThemeData(context,
          choiceChipTheme: const ChoiceChipThemeData(
            selectedBackgroundColor: Colors.green,
          ),
          controlButtonBarTheme: ControlButtonBarThemeData(
              controlButtonTheme:
                  const ControlButtonThemeData(primaryButtonBackgroundColor: Colors.green, textStyle: TextStyle(color: Colors.green)))),
      selectedListData: selectedUserList,
      choiceChipLabel: (skill) => skill!,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (skill, query) {
        return skill.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    dao.openDB();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    courseList = dao.getAllCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        onQueryChanged: (query) {},
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
                child: ListView(scrollDirection: Axis.vertical, children: courseList.map((e) => CourseCard(course: e)).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
