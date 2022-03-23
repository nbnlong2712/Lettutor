import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/profile/profile_component_label.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';

class BecomeTeacherScreen extends StatelessWidget {
  BecomeTeacherScreen({Key? key}) : super(key: key);

  static const String router = "/become-teacher-screen";

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Become A Teacher",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.black,),
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
                      ProfileComponentLabel(label: "Country"),
                      ProfileDropDown(
                        listItem: countries,
                        value: countries[0],
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
                        initialValue: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString(),
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
                      ProfileComponentLabel(label: "Interest"),
                      ProfileDropDown(
                        listItem: interests,
                        value: interests[0],
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
                        value: educations[0],
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
                      ProfileComponentLabel(label: "Language"),
                      ProfileDropDown(
                        listItem: educations,
                        value: educations[0],
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
                      ProfileComponentLabel(label: "Target Student"),
                      ProfileDropDown(
                        listItem: levels,
                        value: levels[0],
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
                      TextField(
                        keyboardType: TextInputType.url,
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
                      ProfileComponentLabel(label: "Video"),
                      TextField(
                        keyboardType: TextInputType.url,
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
                      ProfileComponentLabel(label: "Price"),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _nameController,
                        decoration: _decoration(false),
                      ),
                    ],
                  ),
                ),
                LongFloatingButton(onPressed: () {}, child: const Text("Become a teacher"), color: Colors.green,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
