import 'package:contracts/core/resources/color_manager.dart';
import 'package:contracts/core/resources/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/resources/input_decoration_manager.dart';

class RowDropDownItem extends StatelessWidget {
  const RowDropDownItem(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.title});

  final void Function(Object?)? onChanged;
  final Map<String, String> items;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeManage.screen.width / 7,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black,
            ),
          ]),
          child: DropdownButtonFormField(
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
                fontSize: SizeManage.screen.width / 80,
              ),
              iconEnabledColor: ColorManage.primery,
              iconDisabledColor: ColorManage.primery,
              onChanged: onChanged,
              items: items
                  .map((id, name) {
                    return MapEntry(
                      id,
                      DropdownMenuItem(
                        value: id,
                        child: Text(name),
                      ),
                    );
                  })
                  .values
                  .toList()),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
