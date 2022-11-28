import 'package:contracts/core/resources/input_decoration_manager.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/resources/const.dart';

class RowDatePicker extends StatelessWidget {
  RowDatePicker(
      {required this.title, required this.value, required this.controller});

  final String title;
  final String value;
 final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black,
            ),
          ]),
          width: SizeManage.screen.width / 7,
          child: DateTimePicker(
            decoration: InputDecorationManage.textFieldInputDecoration,
            controller: controller,
            type: DateTimePickerType.date,
            validator: (value) {
              if (value!.isEmpty) return 'الرجاء ادخل التاريخ';
              return null;
            },
            textAlign: TextAlign.center,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateHintText: 'اختيار التاريخ',
          ),
        ),
        title == ''
            ? const SizedBox()
            : Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
      ],
    );
  }
}
