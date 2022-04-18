import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/tutor_request.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_card.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/app_search_bar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recase/recase.dart';

class TutorsScreen extends StatefulWidget {
  static const router = "/tutor-screen";

  const TutorsScreen({Key? key}) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  List<TutorCard> tutorList = [];
  List<String> selectedUserList = [];
  bool isShowIndicator = false;

  void openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      listData: Constant.Skills,
      enableOnlySingleSelection: true,
      hideSearchField: true,
      themeData: FilterListThemeData(context,
          choiceChipTheme: const ChoiceChipThemeData(selectedBackgroundColor: Colors.green),
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
    fetchTutorList();
  }

  void fetchTutorList() async{
    setState(() {
      isShowIndicator = true;
    });
    await TutorRequest.fetchAllTutor().then((value) {
      tutorList = value.map((tutor) => TutorCard(tutor: tutor)).toList();
      setState(() {
        isShowIndicator = false;
      });
    }).catchError((e){
      print(e);
      isShowIndicator = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Tutors", style: TextStyle(color: Colors.black)),
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
      body: ModalProgressHUD(
        inAsyncCall: isShowIndicator,
        dismissible: !isShowIndicator,
        child: SingleChildScrollView(
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                AppSearchBar(hint: "Search tutors...", onQueryChanged: (query) {}),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.721,
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
      ),
    );
  }
}
