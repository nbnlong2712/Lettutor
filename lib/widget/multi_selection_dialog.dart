import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectionDialog extends StatelessWidget {
  MultiSelectionDialog({
    Key? key,
    required this.items,
    required this.onConfirm,
  }) : super(key: key);

  List<MultiSelectItem> items;
  Function(List<dynamic>) onConfirm;

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      selectedColor: Colors.green,
      selectedItemsTextStyle: const TextStyle(color: Colors.white),
      items: items,
      listType: MultiSelectListType.CHIP,
      onConfirm: onConfirm,
    );
  }
}
