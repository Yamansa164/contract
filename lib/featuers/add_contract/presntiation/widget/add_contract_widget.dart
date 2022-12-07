import 'package:contracts/core/resources/const.dart';
import 'package:contracts/core/widget/column_drop_down_item.dart';
import 'package:contracts/core/widget/row_drop_down_item.dart';
import 'package:contracts/core/widget/new_button.dart';

import 'package:flutter/material.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/resources/text_style_manager.dart';
import '../../../../core/widget/column_text_field.dart';
import '../../../../core/widget/column_date_picker.dart';
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ColumnDropDownItem(
                              items: ConstManage.branchItems,
                              onChanged: (branchName) {
                                bloc.setBranch(branchName.toString());
                              },
                              title: ' : اسم الفرع',
                              value: bloc.branch.text,
                            ),
                            ColumnDropDownItem(
                              items: ConstManage.addressItems,
                              onChanged: (areaName) {
                                bloc.setAreaName(areaName.toString());
                              },
                              title: ' : اسم الموقع',
                              value: bloc.areaName.text,
                            ),
                          ],
                        ),
                        RowContract(
                          string1: ':  مدة العقد ',
                          string2: ':  اسم المشروع',
                          string3: ': التوقيفات ',
                          textEditingController1: bloc.executionPeriod,
                          textEditingController2: bloc.projectName,
                          textEditingController3: bloc.stopping,
                          type1: 'num',
                          type3: 'num',
                        ),
                        RowContract(
                          string1: ': رقم العقد',
                          string2: ': نسبة الضم   ',
                          string3: ': نسبة التزيل   ',
                          textEditingController1: bloc.contractNum,
                          textEditingController2: bloc.upPercent,
                          textEditingController3: bloc.downPercent,
                          type2: 'num',
                          type3: 'num',
                          lable2: 'نسبة مئوية +',
                          lable3: 'نسبة مئوية -',
                        ),
                        SizedBox(
                          height: SizeManage.screen.height / 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          textDirection: TextDirection.rtl,
                          children: [
                            ColumnDatePicker(
                              title: ': تاريخ العقد',
                              controller: bloc.contractDate,
                              value: bloc.contractDate.text,
                            ),
                            ColumnDatePicker(
                              title: ':   تاريخ المباشرة ',
                              controller: bloc.startDate,
                              value: bloc.startDate.text,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeManage.screen.height / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ColumnDropDownItem(
                              items: ConstManage.excutingAgenceItems,
                              onChanged: (executingAgencyName) {
                                bloc.setexecutingAgency(
                                    executingAgencyName.toString());
                              },
                              title: ' :  الجهةالمنفذة',
                              value: bloc.executingAgency.text,
                            ),
                            ColumnDropDownItem(
                              items: ConstManage.watchingAgenceItems,
                              onChanged: (watchingAgencyName) {
                                bloc.setwatchingAgency(
                                    watchingAgencyName.toString());
                              },
                              title: ' :  الجهةالمشرفة',
                              value: bloc.watchingAgency.text,
                            )
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
