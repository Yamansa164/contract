import 'package:contracts/core/resources/color_manager.dart';
import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/search_contract_bloc.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/resources/text_style_manager.dart';

// ignore: must_be_immutable
class SearchContractTableWidget extends StatelessWidget {
  SearchContractTableWidget({super.key, required this.bloc});

  SearchContractBloc bloc;
  @override
  Widget build(BuildContext context) {
    List<EasyTableColumn<ContractsModel>> listColumn = [
      EasyTableColumn<ContractsModel>(
          resizable: false,
          width: 200,
          name: 'الكشوف ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          cellBuilder: (context, data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NewButton(
                  width: 20,
                  buttonName: 'اضافة كشف',
                  color: ColorManage.primery,
                  onPressed: () {
                    bloc.contractsModel=data.row;
                 
                    bloc.add(GoToAddStatementsEvent());
                  },
                  fontsize: 12,
                ),
                NewButton(
                  width: 20,
                  buttonName: 'عرض كشف',
                  color: ColorManage.primery,
                  onPressed: () {
                    print(data.row.contractNum);
                 
                  },
                  fontsize: 12,
                ),
              ],
            );
          },
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<ContractsModel>(
          resizable: false,
          width: 200,
          name: 'جدول كميات ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          cellBuilder: (context, data) {
            return NewButton(
              width: 17,
              buttonName: 'عرض المواد',
              color: ColorManage.primery,
              onPressed: () {
                print(data.row.contractNum);
              },
              fontsize: 12,
            );
          },
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<ContractsModel>(
          name: 'المباشرة',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: ((row) => row.starteDate),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<ContractsModel>(
          name: 'الجهة المنفذة',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: ((row) => row.executingAgency),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<ContractsModel>(
          name: 'رقم العقد ',
          stringValue: (row) => row.contractNum,
          headerTextStyle: TextStyleMange.headerTextStyle,
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<ContractsModel>(
          name: 'الفرع ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: (row) => row.branch,
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
    ];
    return Material(
      type: MaterialType.transparency,
      child: EasyTable(
        EasyTableModel<ContractsModel>(
            rows: bloc.listContractsModel!.contract.map((e) => e).toList(),
            columns: listColumn),
        columnsFit: true,
      ),
    );
  }
}
