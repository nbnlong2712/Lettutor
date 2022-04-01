import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/profile/profile_component_label.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/widget/multi_selection_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class BecomeTeacherScreen extends StatefulWidget {
  BecomeTeacherScreen({Key? key}) : super(key: key);

  static const String router = "/become-teacher-screen";

  @override
  State<BecomeTeacherScreen> createState() => _BecomeTeacherScreenState();
}

class _BecomeTeacherScreenState extends State<BecomeTeacherScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<String> selectInterest = [];
  List<String> selectLanguage = [];

  String targetStudent = levels[0];
  String education = educations[0];

  InputDecoration _decoration(bool readOnly) {
    return InputDecoration(
      fillColor: Colors.black12,
      filled: readOnly,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = mainUser.name;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(dao.isTutorExists(mainUser.email))
      {
        Tutor tutor = dao.getTutorByEmail(mainUser.email);
        _phoneController.text = tutor.phone.toString();
        selectInterest = tutor.interests;
        selectLanguage = tutor.languages;
        education = tutor.education;
        _experienceController.text = tutor.experience;
        _bioController.text = tutor.bio;
        targetStudent = tutor.targetStudent;
        _videoController.text = tutor.videoUrl;
        _priceController.text = tutor.price.toString();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Become A Teacher",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Name"),
                      TextField(
                        readOnly: true,
                        controller: _nameController,
                        decoration: _decoration(false),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Phone"),
                      TextField(
                        controller: _phoneController,
                        decoration: _decoration(false),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Interest"),
                      MultiSelectionDialog(
                        initialValue: selectInterest,
                        items: interests.map((e) => MultiSelectItem(e, e)).toList(),
                        onConfirm: (values) {
                          selectInterest = values.map((e) => e.toString()).toList();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Education"),
                      ProfileDropDown(
                        listItem: educations,
                        value: education,
                        onChanged: (value) {
                          setState(() {
                            education = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Experience"),
                      TextField(
                        maxLines: 5,
                        controller: _experienceController,
                        decoration: _decoration(false),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Language"),
                      MultiSelectionDialog(
                        initialValue: selectLanguage,
                        items: countries.map((e) => MultiSelectItem(e, e)).toList(),
                        onConfirm: (values) {
                          selectLanguage = values.map((e) => e.toString()).toList();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Bio"),
                      TextField(
                        maxLines: 5,
                        controller: _bioController,
                        decoration: _decoration(false),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Target Student"),
                      ProfileDropDown(
                        listItem: levels,
                        value: targetStudent,
                        onChanged: (value) {
                          setState(() {
                            targetStudent = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Video"),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton.extended(
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                                if (result != null) {
                                  _videoController.text = result.files.first.path!;
                                } else {
                                  print("NULLLLLLLLLLLLLLLLLLLLLLL");
                                }
                              },
                              label: const Text("Choose your video"),
                              icon: const Icon(Icons.video_collection, color: Colors.red),
                              elevation: 1,
                              backgroundColor: Colors.black38,
                            ),
                          ),
                          TextField(
                            readOnly: true,
                            keyboardType: TextInputType.url,
                            controller: _videoController,
                            decoration: _decoration(false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProfileComponentLabel(label: "Price"),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        decoration: _decoration(false),
                      ),
                    ],
                  ),
                ),
                LongFloatingButton(
                  onPressed: () {
                    Tutor newTutor = Tutor(
                        mainUser.avatar,
                        mainUser.password,
                        mainUser.name,
                        mainUser.email,
                        mainUser.country,
                        _phoneController.text,
                        selectInterest,
                        _experienceController.text,
                        _bioController.text,
                        targetStudent,
                        _videoController.text,
                        education,
                        int.parse(_priceController.text),
                        selectLanguage,
                        mainUser.birthDay,
                        mainUser.level,
                        "Teacher",
                        0,
                        false,
                        "Handsome",
                        false);
                    if (dao.isEmailDuplicateTutor(mainUser.email)) {
                      Tutor tutor = dao.getTutorByEmail(mainUser.email);
                      tutor.avatar = newTutor.avatar;
                      tutor.email = newTutor.email;
                      tutor.name = newTutor.name;
                      tutor.description = newTutor.description;
                      tutor.languages = newTutor.languages;
                      tutor.country = newTutor.country;
                      tutor.bio = newTutor.bio;
                      tutor.targetStudent = newTutor.targetStudent;
                      tutor.education = newTutor.education;
                      tutor.level = newTutor.level;
                      tutor.birthDay = newTutor.birthDay;
                      tutor.password = newTutor.password;
                      tutor.interests = newTutor.interests;
                      tutor.role = newTutor.role;
                      tutor.phone = newTutor.phone;
                      tutor.stars = newTutor.stars;
                      tutor.price = newTutor.price;
                      tutor.experience = newTutor.experience;
                      tutor.videoUrl = newTutor.videoUrl;
                      dao.updateTutor(tutor);
                    } else {
                      dao.addTutor(newTutor);
                      List<Schedule> schedules = [
                        Schedule(newTutor.id, null, DateTime(2022, 4, 1, 19, 0, 0), DateTime(2022, 4, 1, 20, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 1, 20, 0, 0), DateTime(2022, 4, 1, 21, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 1, 21, 0, 0), DateTime(2022, 4, 1, 22, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 2, 19, 0, 0), DateTime(2022, 4, 2, 20, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 2, 20, 0, 0), DateTime(2022, 4, 2, 21, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 2, 21, 0, 0), DateTime(2022, 4, 2, 22, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 3, 19, 0, 0), DateTime(2022, 4, 3, 20, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 3, 20, 0, 0), DateTime(2022, 4, 3, 21, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 3, 21, 0, 0), DateTime(2022, 4, 3, 22, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 4, 19, 0, 0), DateTime(2022, 4, 4, 20, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 4, 20, 0, 0), DateTime(2022, 4, 4, 21, 0, 0), false),
                        Schedule(newTutor.id, null, DateTime(2022, 4, 4, 21, 0, 0), DateTime(2022, 4, 4, 22, 0, 0), false)
                      ];
                      dao.addListSchedules(schedules);
                      dao.getAllScheduleByTutorId(newTutor.id).forEach((element) {
                        print(element.toString());
                      });
                    }
                    Navigator.popAndPushNamed(context, HomePage.router);
                  },
                  child: const Text("Become a teacher"),
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
