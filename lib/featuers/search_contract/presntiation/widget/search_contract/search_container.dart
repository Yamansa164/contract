import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/widget/new_button.dart';
import '../../../../../core/widget/row_text_field.dart';
import '../../bloc/contract_bloc.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final ContractBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecorationManage.tableDecoration,
      height: SizeManage.screen.height / 2,
      width: SizeManage.screen.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowTextField(
            type: 'name',
            title: ': الفرع ',
            textEditingController: bloc.branch,
          ),
          RowTextField(
            type: 'num',
            title: ': رقم العقد',
            textEditingController: bloc.contractNum,
          ),
          RowTextField(
            type: 'name',
            title: ': الجهة المنفذة',
            textEditingController: bloc.executingAgency,
          ),
          SizedBox(
            height: SizeManage.screen.height / 50,
          ),
          NewButton(
            width: 12,
            buttonName: 'البحث',
            color: ColorManage.primery,
            onPressed: () {
              bloc.add(DoSearchContractEvent());
            },
          )
        ],
      ),
    );
  }
}
