
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/const.dart';

class DatePicker extends StatelessWidget {
  DatePicker({required this.title, required this.onChanged});

  final String title;
  final void Function(String)? onChanged;

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
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black,
            ),
          ]),
          width: SizeManage.screen.width / 7,
          child: DateTimePicker(
            validator: (value) {
              if (value!.isEmpty) return 'الرجاء ادخل التاريخ';
              return null;
            },
            textAlign: TextAlign.center,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateHintText: 'اختيار التاريخ',
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
