import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/user_request.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/models/subject.dart';
import 'package:flutter_lettutor/screens/profile/profile_component_label.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/widget/multi_selection_dialog.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  List<String> learnTopics = [];
  List<String> testPreparations = [];
  bool isShowIndicator = false;

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

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = mainUser.name!;
    _phoneController.text = mainUser.phone!;
    _countryController.text = mainUser.country!.isNotEmpty ? mainUser.country! : "VN";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isShowIndicator,
        child: SingleChildScrollView(
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                              if (result != null) {
                                setState(() {
                                  mainUser.avatar = result.files.single.path!;
                                });
                              } else {
                                print("NULLLLLLLLLLLLLLLLLLLLLLL");
                              }
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(mainUser.avatar!),
                              radius: 55,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              mainUser.email,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ProfileComponentLabel(label: "Name"),
                            TextField(
                              autofocus: false,
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
                            ProfileComponentLabel(label: "Birthday"),
                            DateTimePicker(
                              initialValue: mainUser.birthday.toString(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2023),
                              decoration: _decoration(false),
                              onChanged: (value) {
                                mainUser.birthday = DateTime.parse(value);
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
                            ProfileComponentLabel(label: "Phone"),
                            TextField(
                              controller: _phoneController,
                              decoration: _decoration(true),
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton.extended(
                              onPressed: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    setState(() {
                                      mainUser.country = country.countryCode;
                                      _countryController.text = country.countryCode;
                                    });
                                  },
                                );
                              },
                              label: Text("Choose country"),
                              backgroundColor: Colors.green,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: _countryController,
                                readOnly: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ProfileComponentLabel(label: "Level"),
                            ProfileDropDown(
                              listItem: Constant.Levels.values.toList(),
                              value: mainUser.level!,
                              onChanged: (value) {
                                setState(() {
                                  mainUser.level = value!;
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
                            ProfileComponentLabel(label: "Want to learn"),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Subjects", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                                      MultiSelectionDialog(
                                        initialValue: mainUser.learnTopics!.map((e) => e.name).toList(),
                                        items: Constant.LearnTopics.map((e) => MultiSelectItem(e.name, e.name)).toList(),
                                        onConfirm: (values) {
                                          mainUser.learnTopics = values.map((e) => Subject.getLearnTopicByName(e.toString())).toList(growable: true);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Test preparation", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                                      MultiSelectionDialog(
                                        initialValue: mainUser.testPreparations!.map((e) => e.name).toList(),
                                        items: Constant.TestPreparations.map((e) => MultiSelectItem(e.name, e.name)).toList(),
                                        onConfirm: (values) {
                                          mainUser.testPreparations =
                                              values.map((e) => Subject.getTestPreparationByName(e.toString())).toList(growable: true);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      LongFloatingButton(
                        onPressed: () async {
                          if (_nameController.text.isNotEmpty) {
                            setState(() {
                              isShowIndicator = true;
                            });
                            mainUser.name = _nameController.text;
                            await UserRequest.updateUser(mainUser).then((value) {
                              setState(() {
                                isShowIndicator = false;
                              });
                              if (!value) {
                                ScaffoldMessenger.of(context).showSnackBar(_snackBar("Update failed!", Colors.red));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(_snackBar("Update success!", Colors.green));
                                Navigator.popAndPushNamed(context, HomePage.router);
                              }
                            }).catchError((e) {
                              setState(() {
                                isShowIndicator = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(_snackBar("Update failed!", Colors.red));
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please fill enough!", Colors.red));
                          }
                        },
                        child: const Text("Save"),
                        color: Colors.green,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
