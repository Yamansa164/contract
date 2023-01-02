import 'package:contracts/core/resources/color_manager.dart';
import 'package:contracts/core/resources/const.dart';
import 'package:flutter/material.dart';


import '../../../../core/resources/input_decoration_manager.dart';

class ColumnDropDownItem extends StatelessWidget {
  const ColumnDropDownItem(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.title,
      required this.value});

  final void Function(Object?)? onChanged;
  final List<String> items;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        Container(
          width: SizeManage.screen.width / 7,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black,
            ),
          ]),
          child: DropdownButtonFormField(
            value: value == '' ? null : value,
            decoration: InputDecorationManage.textFieldInputDecoration,
            isExpanded: true,
            alignment: Alignment.topCenter,
            validator: (value) {
              if (value == null) {
                return 'ادخل معلومات';
              }
              return null;
            },
            iconSize: SizeManage.screen.width / 40,
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: SizeManage.screen.width / 100,
            ),
            iconEnabledColor: ColorManage.primery,
            iconDisabledColor: ColorManage.primery,
            onChanged: onChanged,
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
