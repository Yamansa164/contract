import 'package:contracts/core/resources/const.dart';
import 'package:contracts/core/resources/text_style_manager.dart';
import 'package:contracts/core/widget/date_picker.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/search_contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/statements_table.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/table_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddStatementsWidget extends StatelessWidget {
  AddStatementsWidget({super.key, required this.bloc});
  SearchContractBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DatePicker(
                  title: '',
                  onChanged: (date) {
                    bloc.setStatementDate(date);
                  }),
              SizedBox(
                width: SizeManage.screen.width / 30,
              ),
              Text(
                ': قيمة الاعمال والاشغال بالمواد لغاية',
                style: TextStyleMange.headerTextStyle
                    .copyWith(color: Colors.white, letterSpacing: 0.6),
              ),
            ],
          ),
          SizedBox(
            height: SizeManage.screen.height / 100,
          ),
          TableItemWidget(
            bloc: bloc,
            tableWidget: StatementsTableWidget(bloc: bloc),
            buttonName: 'تنظيم الكشف',
            onPressed: () {
              print(bloc.contractsModel!.listMaterial.map((e) {
                print(e.statementsAmount.text);
                print(e.name);
                print(bloc.getStatementDate);
              }));
            },
          )
        ],
      ),
    );
  }
}
