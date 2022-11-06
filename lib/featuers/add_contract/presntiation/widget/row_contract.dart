import 'package:flutter/material.dart';

import '../../../../../../../core/resources/const.dart';
import '../../../../core/widget/column_text_field.dart';

class RowContract extends StatelessWidget {
  final String string1;
  final String string2;
  final String string3;
  final TextEditingController textEditingController1;
  final TextEditingController textEditingController2;
  final TextEditingController textEditingController3;
  final String type1;
  final String type2;
  final String type3;
  final String lable1;
  final String lable2;
  final String lable3;

  const RowContract(
      {super.key,
      required this.string1,
      required this.string2,
      required this.string3,
      required this.textEditingController1,
      required this.textEditingController2,
      required this.textEditingController3,
      this.type1 = 'name',
      this.type2 = 'name',
      this.type3 = 'name',
       this.lable1 ='',
       this.lable2='',
       this.lable3=''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeManage.screen.width / 150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        textDirection: TextDirection.rtl,
        children: [
          ColumnTextField(
            textEditingController: textEditingController1,
            title: string1,
            type: type1,
            lable: lable1,
          ),
          ColumnTextField(
            textEditingController: textEditingController2,
            title: string2,
            type: type2,
            lable: lable2,
          ),
          ColumnTextField(
            textEditingController: textEditingController3,
            title: string3,
            type: type3,
            lable: lable3,
          )
        ],
      ),
    );
  }
}
