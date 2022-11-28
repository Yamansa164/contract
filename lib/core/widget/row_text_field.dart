import 'package:contracts/core/resources/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/input_decoration_manager.dart';

class RowTextField extends StatelessWidget {
  RowTextField(
      {required this.textEditingController,
      this.labelText='',
      required this.title,
      required this.type});
  final String title;
  final String type;
  final String labelText;
  final TextEditingController textEditingController;

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
          child: Padding(
            padding: EdgeInsets.only(right: SizeManage.screen.width / 80),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  if (type != 'name') FilteringTextInputFormatter.digitsOnly
                ],
                controller: textEditingController,
                decoration: InputDecorationManage.textFieldInputDecoration,
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
