import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/profile/profile_component_label.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/widget/selection_skill_tag.dart';
import 'package:flutter_lettutor/widget/selection_skill_tag.dart';
import 'package:flutter_lettutor/widget/selection_skill_tag.dart';
import 'package:flutter_lettutor/widget/selection_skill_tag.dart';
import 'package:flutter_lettutor/widget/selection_skill_tag.dart';
import 'package:flutter_lettutor/widget/selection_skill_tag.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen(
      {Key? key,
      required this.email,
      required this.avatar,
      required this.name,
      required this.birthDay,
      required this.country,
      required this.level,
      required this.phoneNumber})
      : super(key: key);

  String email;
  String avatar;
  String name;
  String phoneNumber;
  String birthDay;
  String country;
  String level;

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
  Widget build(BuildContext context) {
    _nameController.text = name;
    _phoneController.text = phoneNumber;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: GestureDetector(child: Icon(Icons.arrow_back, color: Colors.black), onTap: (){Navigator.pop(context);},),
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
                          backgroundImage: AssetImage(avatar),
                          radius: 55,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            email,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
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
                            initialValue: birthDay,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2023),
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
                            value: country,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProfileComponentLabel(label: "Level"),
                          ProfileDropDown(
                            listItem: levels,
                            value: level,
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
                                SelectionSkillTag(
                                    isSelected: false,
                                    skillName: "English for Kids"),
                                SelectionSkillTag(
                                    isSelected: false,
                                    skillName: "Business English"),
                                SelectionSkillTag(
                                    isSelected: false,
                                    skillName: "Conversational English"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProfileComponentLabel(label: "Test preparation"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: <Widget>[
                                SelectionSkillTag(
                                    isSelected: false, skillName: "STARTERS"),
                                SelectionSkillTag(
                                    isSelected: false, skillName: "MOVERS"),
                                SelectionSkillTag(
                                    isSelected: false, skillName: "FLYERS"),
                                SelectionSkillTag(
                                    isSelected: false, skillName: "KET"),
                                SelectionSkillTag(
                                    isSelected: false, skillName: "PET"),
                                SelectionSkillTag(
                                    isSelected: false, skillName: "IELTS"),
                                SelectionSkillTag(
                                    isSelected: false, skillName: "TOEFL"),
                                SelectionSkillTag(
                                    isSelected: false, skillName: "TOEIC"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    LongFloatingButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: const Text("Save"),
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
