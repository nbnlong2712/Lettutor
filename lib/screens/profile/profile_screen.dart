import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:flutter_lettutor/screens/profile/profile_component_label.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/widget/selection_skill_chip.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
    dao.openDB();
    _nameController.text = mainUser.name;
    _phoneController.text = mainUser.phone!;
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
      body: SingleChildScrollView(
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
                        CircleAvatar(
                          backgroundImage: AssetImage(mainUser.avatar),
                          radius: 55,
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
                            initialValue: mainUser.birthDay.toString(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2023),
                            decoration: _decoration(false),
                            onChanged: (value) {
                              mainUser.birthDay = DateTime.parse(value);
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProfileComponentLabel(label: "Country"),
                          ProfileDropDown(
                            listItem: countries,
                            value: mainUser.country,
                            onChanged: (value) {
                              setState(() {
                                mainUser.country = value!;
                              });
                            },
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
                            listItem: levels,
                            value: mainUser.level,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: <Widget>[
                                SelectionSkillChip(isSelected: false, skillName: "English for Kids"),
                                SelectionSkillChip(isSelected: false, skillName: "Business English"),
                                SelectionSkillChip(isSelected: false, skillName: "Conversational English"),
                                SelectionSkillChip(isSelected: false, skillName: "KET"),
                                SelectionSkillChip(isSelected: false, skillName: "PET"),
                                SelectionSkillChip(isSelected: false, skillName: "IELTS"),
                                SelectionSkillChip(isSelected: false, skillName: "TOEFL"),
                                SelectionSkillChip(isSelected: false, skillName: "TOEIC"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    LongFloatingButton(
                      onPressed: () {
                        mainUser.name = _nameController.text;
                        dao.updateUser(mainUser);
                        List<User> users = dao.getAllUserFromDb();
                        users.forEach((element) {
                          print(element.toString());
                        });
                        Navigator.popAndPushNamed(context, HomePage.router);
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
    );
  }
}
