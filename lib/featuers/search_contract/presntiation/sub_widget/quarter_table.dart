import 'package:contracts/core/widget/column_text_field.dart';
import 'package:contracts/core/widget/row_text_field.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../core/resources/text_style_manager.dart';
import '../../../../core/resources/const.dart';
import '../../../../core/resources/input_decoration_manager.dart';

// ignore: must_be_immutable
class QuarterTable extends StatelessWidget {
  QuarterTable({super.key, required this.bloc,});
  ContractBloc bloc;

  @override
  Widget build(BuildContext context) {
   
    
    return Material(
      type: MaterialType.transparency,
      child: EasyTable<MaterialModel>(
        EasyTableModel<MaterialModel>(
            rows: bloc.listMaterialToAddToQuarter, columns: listColumn),
        columnsFit: true,
      ),
    );
  }
   List<EasyTableColumn<MaterialModel>> listColumn = [
      EasyTableColumn<MaterialModel>(
          resizable: false,
          width: 200,
          name: 'ربع نظامي ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: (row) => '${row.quarterPercent}%',
          
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'السعر المفرد',
          doubleValue: (row) => row.individualPrice,
          headerTextStyle: TextStyleMange.headerTextStyle,
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الكمية المتبقية',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: ((row) => (row.notUsedQuantity)),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الكمية الكلية',
          headerTextStyle: TextStyleMange.headerTextStyle,
          intValue: ((row) => row.quantity),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الوحدة',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: ((row) => row.unit),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الاسم',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: ((row) => row.name),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الرقم',
          headerTextStyle: TextStyleMange.headerTextStyle,
          stringValue: ((row) => row.number),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
    ];
}
