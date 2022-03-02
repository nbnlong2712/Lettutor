import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_card.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class TutorsScreen extends StatefulWidget {
  static const router = "/tutor-screen";

  const TutorsScreen({Key? key}) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  @override
  Widget build(BuildContext context) {
    List<TutorCard> tutorList = [
      TutorCard(
        describe:
            "First, you need a data source. For example, your data source might be a list of messages,"
            " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
        avatar: "assets/images/avatar_long.png",
        tutorName: "Nhat long",
      ),
      TutorCard(
        describe:
            "First, you need a data source. For example, your data source might be a list of messages,"
            " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
        avatar: "assets/images/avatar_long.png",
        tutorName: "Nhat long",
      ),
      TutorCard(
        describe:
            "First, you need a data source. For example, your data source might be a list of messages,"
            " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
        avatar: "assets/images/avatar_long.png",
        tutorName: "Nhat long",
      ),
      TutorCard(
        describe:
            "First, you need a data source. For example, your data source might be a list of messages,"
            " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
        avatar: "assets/images/avatar_long.png",
        tutorName: "Nhat long",
      ),
      TutorCard(
        describe:
            "First, you need a data source. For example, your data source might be a list of messages,"
            " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
        avatar: "assets/images/avatar_long.png",
        tutorName: "Nhat long",
      )
    ];

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

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
                    primaryButtonBackgroundColor: Colors.green,
                    textStyle: TextStyle(color: Colors.green)))),
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Tutors",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
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
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: FloatingSearchBar(
                      hint: 'Search tutors...',
                      backdropColor: Colors.white10,
                      backgroundColor: Colors.grey.shade300,
                      closeOnBackdropTap: true,
                      elevation: 2,
                      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                      transitionDuration: const Duration(milliseconds: 300),
                      transitionCurve: Curves.easeInOut,
                      borderRadius: BorderRadius.circular(15),
                      physics: const BouncingScrollPhysics(),
                      axisAlignment: isPortrait ? 0.0 : -1.0,
                      width: isPortrait ? 600 : 500,
                      onQueryChanged: (query) {},
                      transition: CircularFloatingSearchBarTransition(),
                      builder: (context, transition) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Material(
                            color: Colors.white,
                            elevation: 4.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: Colors.accents.map((_) {
                                return Container(
                                    height: 0, color: Colors.white);
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
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
