import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/course/courses/course_screen.dart';
import 'package:flutter_lettutor/screens/course/ebook/ebook_screen.dart';
import 'package:flutter_lettutor/utils/constant.dart';

class CoursePage extends StatefulWidget {
  static const router = "/course-page";

  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<String> selectedUserList = [];

  void openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      listData: Constant.Skills,
      themeData: FilterListThemeData(context,
          choiceChipTheme: const ChoiceChipThemeData(
            selectedBackgroundColor: Colors.green,
          ),
          controlButtonBarTheme: ControlButtonBarThemeData(
              controlButtonTheme: const ControlButtonThemeData(
                  primaryButtonBackgroundColor: Colors.green, textStyle: TextStyle(color: Colors.green)))),
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Courses",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.green,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.video_collection_outlined, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Course", style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.menu_book_outlined, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Ebook", style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CourseScreen(),
            EbookScreen(),
          ],
        ),
      ),
    );
  }
}
