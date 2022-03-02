import 'package:flutter/material.dart';

class ProfileDropDown extends StatefulWidget {
  ProfileDropDown({
    Key? key,
    required this.listItem,
    required this.value,
  }) : super(key: key);

  List<String> listItem;
  String value;

  @override
  _ProfileDropDownState createState() => _ProfileDropDownState();
}

class _ProfileDropDownState extends State<ProfileDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(12),
          )
        ),
        child: DropdownButton<String?>(
          value: widget.value,
          items: widget.listItem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.value = value!;
            });
          },
          borderRadius: BorderRadius.circular(12),
          underline: Text(""),
          isExpanded: true,
          isDense: true,
        ),
      ),
    );
  }
}
