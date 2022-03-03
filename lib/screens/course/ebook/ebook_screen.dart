import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/course/courses/course_card.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/app_search_bar.dart';

import 'ebook_card.dart';

class EbookScreen extends StatefulWidget {
  const EbookScreen({Key? key}) : super(key: key);

  @override
  State<EbookScreen> createState() => _EbookScreenState();
}

class _EbookScreenState extends State<EbookScreen> {
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
                        hint: "Search ebook...",
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
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    EbookCard(
                      background: "assets/images/ebook_background.jpg",
                      ebookName: 'Life in the Internet Age',
                      level: 'Intermediate',
                      describe:
                          "Hello, my name is Long, how are you? I'm fine thank you, and you? I'm fine, thanks! Let's go, let's rock!",
                    ),
                    EbookCard(
                      background: "assets/images/ebook_background.jpg",
                      ebookName: 'Life in the Internet Age',
                      level: 'Intermediate',
                      describe:
                          "Hello, my name is Long, how are you? I'm fine thank you, and you? I'm fine, thanks! Let's go, let's rock!",
                    ),
                    EbookCard(
                      background: "assets/images/ebook_background.jpg",
                      ebookName: 'Life in the Internet Age',
                      level: 'Intermediate',
                      describe:
                          "Hello, my name is Long, how are you? I'm fine thank you, and you? I'm fine, thanks! Let's go, let's rock!",
                    ),
                    EbookCard(
                      background: "assets/images/ebook_background.jpg",
                      ebookName: 'Life in the Internet Age',
                      level: 'Intermediate',
                      describe:
                          "Hello, my name is Long, how are you? I'm fine thank you, and you? I'm fine, thanks! Let's go, let's rock!",
                    ),
                    EbookCard(
                      background: "assets/images/ebook_background.jpg",
                      ebookName: 'Life in the Internet Age',
                      level: 'Intermediate',
                      describe:
                          "Hello, my name is Long, how are you? I'm fine thank you, and you? I'm fine, thanks! Let's go, let's rock!",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
