import 'package:contracts/core/resources/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/input_decoration_manager.dart';

class ColumnTextField extends StatelessWidget {
  ColumnTextField(
      {required this.textEditingController,
      required this.title,
      required this.type,
      this.lable = '',this.width=7,this.height=15});
  final String title;
  final String type;
  final String lable;
  final int width;
  final int height;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        title == ''
            ? const SizedBox()
            : Text(
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
          width: SizeManage.screen.width / width,
          height: SizeManage.screen.height/height,
          child: Padding(
            padding: EdgeInsets.only(right: SizeManage.screen.width / 80),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  if (type != 'name') 
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                ],
                controller: textEditingController,
                decoration: InputDecoration(labelText: lable),
                cursorColor: Colors.black,
                textAlign: TextAlign.right,
                validator: (value) {
                  if (value!.isEmpty) return 'الرجاء ادخل معلومات';
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
