import 'package:contracts/core/resources/const.dart';
import 'package:contracts/core/widget/new_button.dart';

import 'package:flutter/material.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/resources/text_style_manager.dart';
import '../../../../core/widget/column_text_field.dart';
import '../../../../core/widget/date_picker.dart';
import 'row_contract.dart';
import '../bloc/add_contract_bloc.dart';

class AddContractWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  AddContractBloc bloc;
  AddContractWidget({required this.bloc});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: ColorManage.primery,
        width: SizeManage.screen.width,
        height: SizeManage.screen.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: DecorationManage.tableDecoration,
                  height: SizeManage.screen.height - 300,
                  width: SizeManage.screen.width / 2,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: SizeManage.screen.width / 150,
                        ),
                        Center(
                          child: Text(
                            'معلومات العقد',
                            style: TextStyleMange.headerTextStyle,
                          ),
                        ),
                        RowContract(
                          string1: ':  اسم الفرع',
                          string2: ': اسم المشروع',
                          string3: ': رقم العقد',
                          textEditingController1: bloc.branch,
                          textEditingController2: bloc.projectName,
                          textEditingController3: bloc.contractNum,
                        ),
                        RowContract(
                          string1: ':  مدة العقد ',
                          string2: ': مضمون العقد',
                          string3: ': قيمة العقد',
                          textEditingController1: bloc.executionPeriod,
                          textEditingController2: bloc.content,
                          textEditingController3: bloc.contractPrice,
                          type1: 'num',
                          type3: 'num',
                        ),
                        RowContract(
                          string1: ': نسبة الضم   ',
                          string2: ': نسبة التزيل   ',
                          string3: ': قيمة بدل الاحالة  ',
                          textEditingController1: bloc.upPercent,
                          textEditingController2: bloc.downPercent,
                          textEditingController3: bloc.newPrice,
                          type1: 'num',
                          type2: 'num',
                          type3: 'num',
                          lable1: 'نسبة مئوية +',
                          lable2: 'نسبة مئوية -',
                        ),
                        SizedBox(
                          height: SizeManage.screen.height / 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          textDirection: TextDirection.rtl,
                          children: [
                            DatePicker(
                              title: ': تاريخ العقد',
                              onChanged: (date) {
                                bloc.setContractDate(date);
                              },
                            ),
                            DatePicker(
                              title: ':   تاريخ المباشرة ',
                              onChanged: (date) {
                                bloc.setStartDate(date);
                              },
                            ),
                            DatePicker(
                              title: ': تاريخ تسليم موقع العمل ',
                              onChanged: (date) {
                                bloc.setFinishingDate(date);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeManage.screen.height / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ColumnTextField(
                              textEditingController: bloc.executingAgency,
                              title: ':  الجهة المنفذة',
                              type: 'name',
                            ),
                            ColumnTextField(
                              textEditingController: bloc.watchingAgency,
                              title: ':  الجهة المشرفة',
                              type: 'name',
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: SizeManage.screen.height / 50,
              ),
              NewButton(
                  width: 5,
                  buttonName: 'اضافة المواد الخاصة بالعقد ',
                  onPressed: (() {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(GoToTableItem());
                    }
                  }),
                  color: ColorManage.second),
            ],
          ),
        ),
      ),
    );
  }
}
