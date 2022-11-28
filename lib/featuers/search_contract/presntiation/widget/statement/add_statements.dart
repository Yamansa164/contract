import 'package:contracts/core/resources/color_manager.dart';
import 'package:contracts/core/resources/const.dart';
import 'package:contracts/core/resources/text_style_manager.dart';
import 'package:contracts/core/widget/column_text_field.dart';
import 'package:contracts/core/widget/column_date_picker.dart';
import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/core/widget/row_text_field.dart';
import 'package:contracts/featuers/search_contract/data/request/add_statements.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/add_statements.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/statements_table.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/table_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStatementsWidget extends StatelessWidget {
  AddStatementsWidget({super.key, required this.bloc});
  ContractBloc bloc;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColumnDatePicker(
                title: '',
                controller: bloc.statementDate,
                value: bloc.statementDate.text,
              ),
              SizedBox(
                width: SizeManage.screen.width / 30,
              ),
              Text(
                ': قيمة الاعمال والاشغال بالمواد لغاية',
                style: TextStyleMange.headerTextStyle
                    .copyWith(color: Colors.white, letterSpacing: 0.6),
              ),
              SizedBox(
                width: SizeManage.screen.width / 25,
              ),
              ColumnTextField(
                textEditingController: bloc.discount,
                title: '',
                type: 'num',
                lable: 'نسبة مئوية',
              ),
              SizedBox(
                width: SizeManage.screen.width / 30,
              ),
              Text(
                ': الحسوميات    ',
                style: TextStyleMange.headerTextStyle
                    .copyWith(color: Colors.white, letterSpacing: 0.6),
              ),
            ],
          ),
          SizedBox(
            height: SizeManage.screen.height / 100,
          ),
          TableItemWidget(
            tableWidget: StatementsTableWidget(bloc: bloc),
            listWidget: [
              NewButton(
                width: 6,
                buttonName: 'الرجوع ',
                color: ColorManage.second,
                onPressed: () {
                  bloc.add(DoSearchContractEvent());
                  bloc.listContractMaterialModel.clear();
                },
              ),
              NewButton(
                width: 6,
                buttonName: 'تنظيم الكشف',
                color: ColorManage.second,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(ExcuteAddStatementsEvent());
                   
                  }
                },
              ),
              NewButton(
                width: 6,
                buttonName: 'اضافة مادة',
                color: ColorManage.second,
                onPressed: () {
                  bloc.add(GoToAddStatementsMaterialEvent());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
