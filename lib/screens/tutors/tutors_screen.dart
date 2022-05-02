import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/mobx/tutor_mobx.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_card.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/app_search_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  TutorMobx tutorMobx = TutorMobx();
  String queryStr = "";

  void openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      listData: Constant.Skills,
      enableOnlySingleSelection: true,
      hideSearchField: true,
      headlineText: "Subject",
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

  List<Tutor> filterTutor() {
    List<Tutor> tutorFound = [];
    if (selectedUserList.isEmpty) {
      tutorFound = tutorMobx.tutorList;
    } else {
      String subjectStr = toBeginningOfSentenceCase(selectedUserList[0].toLowerCase())!;
      for (Tutor tutor in tutorMobx.tutorList) {
        if (tutor.specialties!.contains(subjectStr)) {
          tutorFound.add(tutor);
        }
      }
    }
    return tutorFound;
  }

  List<Tutor> searchTutor(String query) {
    List<Tutor> foundTutor = [];
    List<Tutor> tutors = filterTutor();
    if (query.isEmpty) {
      return tutors;
    } else {
      for (var tutor in tutors) {
        if (tutor.name.toLowerCase().contains(query.toLowerCase())) {
          foundTutor.add(tutor);
        }
      }
      return foundTutor;
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
    tutorMobx.initTutors().then((_) {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.tutors, style: TextStyle(color: Colors.black)),
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
                AppSearchBar(
                    hint: AppLocalizations.of(context)!.searchTutors,
                    onQueryChanged: (query) {
                      setState(() {
                        queryStr = query;
                      });
                    }),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.721,
                      width: MediaQuery.of(context).size.width,
                      child: Observer(
                        builder: (_) {
                          return ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: searchTutor(queryStr).map((tutor) => TutorCard(tutor: tutor)).toList(),
                          );
                        },
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
