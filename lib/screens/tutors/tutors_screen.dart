import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_card.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/app_search_bar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class TutorsScreen extends StatefulWidget {
  static const router = "/tutor-screen";

  const TutorsScreen({Key? key}) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  List<TutorCard> tutorList = [
    TutorCard(
      describe: "First, you need a data source. For example, your data source might be a list of messages,"
          " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
      avatar: "assets/images/avatar_long.png",
      tutorName: "Nhat long",
    ),
    TutorCard(
      describe: "First, you need a data source. For example, your data source might be a list of messages,"
          " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
      avatar: "assets/images/avatar_long.png",
      tutorName: "Nhat long",
    ),
    TutorCard(
      describe: "First, you need a data source. For example, your data source might be a list of messages,"
          " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
      avatar: "assets/images/avatar_long.png",
      tutorName: "Nhat long",
    ),
    TutorCard(
      describe: "First, you need a data source. For example, your data source might be a list of messages,"
          " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
      avatar: "assets/images/avatar_long.png",
      tutorName: "Nhat long",
    ),
    TutorCard(
      describe: "First, you need a data source. For example, your data source might be a list of messages,"
          " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
      avatar: "assets/images/avatar_long.png",
      tutorName: "Nhat long",
    )
  ];

  List<String> selectedUserList = [];

  void openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      listData: skills,
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Tutors",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              child: const Icon(Icons.more_vert_sharp, color: Colors.black),
              onTap: () {
                openFilterDialog();
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              AppSearchBar(hint: "Search tutors...", onQueryChanged: (query) {}),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: tutorList,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
