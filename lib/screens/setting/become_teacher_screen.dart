import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/tutor_request.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/screens/profile/profile_component_label.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/widget/multi_selection_dialog.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();

  List<String> selectSpecialties = [];
  List<String> selectLanguage = [];

  File? avatarFile;
  File? videoFile;

  String targetStudent = Constant.Levels.values.first;
  String education = Constant.Educations[0];

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

  InputDecoration _decoration(bool readOnly) {
    return InputDecoration(
      fillColor: Colors.green,
      filled: readOnly,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  bool showIndicator = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = mainUser.name!;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
          child: const Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: mainUser.tutorInfoId == null
          ? GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                FocusScope.of(context).requestFocus(FocusNode());

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: ModalProgressHUD(
                inAsyncCall: showIndicator,
                child: SingleChildScrollView(
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
                                  keyboardType: TextInputType.phone,
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
                                TextField(
                                  controller: _interestController,
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
                                ProfileComponentLabel(label: "Education"),
                                ProfileDropDown(
                                  listItem: Constant.Educations,
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
                                ProfileComponentLabel(label: "Languages"),
                                MultiSelectionDialog(
                                  initialValue: selectLanguage,
                                  items: Constant.IsoLangs.values.map((e) => MultiSelectItem(e, e)).toList(),
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
                                  listItem: Constant.Levels.values.toList(),
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
                                ProfileComponentLabel(label: "Specialties"),
                                MultiSelectionDialog(
                                  initialValue: selectSpecialties,
                                  items: Constant.Specialties.map((e) => MultiSelectItem(e, e)).toList(),
                                  onConfirm: (values) {
                                    selectSpecialties = values.map((e) => e.toString()).toList();
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
                                ProfileComponentLabel(label: "Avatar"),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FloatingActionButton.extended(
                                        onPressed: () async {
                                          FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                                          if (result != null) {
                                            _avatarController.text = result.files.first.path!;
                                            avatarFile = File(result.files.first.path!);
                                          } else {
                                            print("NULLLLLLLLLLLLLLLLLLLLLLL");
                                          }
                                        },
                                        label: const Text("Choose your avatar"),
                                        icon: const Icon(Icons.photo_library, color: Colors.blueAccent),
                                        elevation: 1,
                                        backgroundColor: Colors.white54,
                                      ),
                                    ),
                                    TextField(
                                      readOnly: true,
                                      keyboardType: TextInputType.url,
                                      controller: _avatarController,
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
                                ProfileComponentLabel(label: "Video"),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FloatingActionButton.extended(
                                        onPressed: () async {
                                          FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video, allowMultiple: false);
                                          if (result != null) {
                                            _videoController.text = result.files.first.path!;
                                            videoFile = File(result.files.first.path!);
                                          } else {
                                            print("NULLLLLLLLLLLLLLLLLLLLLLL");
                                          }
                                        },
                                        label: const Text("Choose your video"),
                                        icon: const Icon(Icons.video_collection, color: Colors.red),
                                        elevation: 1,
                                        backgroundColor: Colors.white54,
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
                            onPressed: () async {
                              if (_avatarController.text.isNotEmpty &&
                                  _nameController.text.isNotEmpty &&
                                  _priceController.text.isNotEmpty &&
                                  _videoController.text.isNotEmpty &&
                                  _bioController.text.isNotEmpty &&
                                  _experienceController.text.isNotEmpty &&
                                  _phoneController.text.isNotEmpty &&
                                  _interestController.text.isNotEmpty &&
                                  selectLanguage.isNotEmpty &&
                                  selectSpecialties.isNotEmpty) {
                                setState(() {
                                  showIndicator = true;
                                });
                                await TutorRequest.becomeTutor(
                                        _nameController.text,
                                        mainUser.country!,
                                        "${mainUser.birthday!.year}-${mainUser.birthday!.month}-${mainUser.birthday!.day}",
                                        _interestController.text,
                                        education,
                                        _experienceController.text,
                                        "Lecturer",
                                        selectLanguage.length > 1 ? selectLanguage.join(",") : selectLanguage[0],
                                        _bioController.text,
                                        targetStudent,
                                        selectSpecialties.length > 1 ? selectSpecialties.join(",") : selectSpecialties[0],
                                        avatarFile!,
                                        videoFile!,
                                        int.parse(_priceController.text))
                                    .then((value) {
                                  setState(() {
                                    showIndicator = false;
                                  });
                                  if (value.statusCode == 200) {
                                    ScaffoldMessenger.of(context).showSnackBar(_snackBar("Become a teacher success!", Colors.green));
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(_snackBar("${value.message} ${value.statusCode}!", Colors.red));
                                  }
                                }).catchError((e){
                                  print("${e.toString()} QuanKaki");
                                  ScaffoldMessenger.of(context).showSnackBar(_snackBar("Become a teacher success!", Colors.green));
                                  Navigator.pop(context);
                                  setState(() {
                                    showIndicator = false;
                                  });
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please fill enough!", Colors.red));
                              }
                            },
                            child: const Text("Become a teacher"),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Image.asset("assets/images/become_tutor.png", scale: 0.7,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("You have done all the steps"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("Please, wait for the operator's approval"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.green,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: Text("Go Back")),
                  )
                ],
              ),
            ),
    );
  }
}
