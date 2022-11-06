import 'package:contracts/core/resources/color_manager.dart';
import 'package:contracts/core/widget/column_text_field.dart';
import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/search_contract_bloc.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/resources/text_style_manager.dart';

// ignore: must_be_immutable
class StatementsTableWidget extends StatelessWidget {
  StatementsTableWidget({super.key, required this.bloc});

  SearchContractBloc bloc;
  @override
  Widget build(BuildContext context) {
    List<EasyTableColumn<MaterialModel>> listColumn = [
      EasyTableColumn<MaterialModel>(
          name: 'الكمية ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          cellBuilder: (context, data) {
            return ColumnTextField(
              textEditingController: data.row.statementsAmount,
              title: '',
              type: 'num',
              width: 8,
              height: 27,
            );
          },
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الوحدة  ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: (row) => row.unit,
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'المادة',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: ((row) => row.name),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الرقم ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          intValue: ((row) => row.number),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
    ];
    return Material(
      type: MaterialType.transparency,
      child: EasyTable(
        EasyTableModel<MaterialModel>(
            rows: bloc.contractsModel!.listMaterial.map((e) => e).toList(),
            columns: listColumn),
        columnsFit: true,
      ),
    );
  }
}
