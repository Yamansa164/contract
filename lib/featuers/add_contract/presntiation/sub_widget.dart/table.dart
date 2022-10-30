
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/text_style_manager.dart';
import '../../domain/entities/contract_material.dart';


// ignore: must_be_immutable
class TableWidget extends StatelessWidget {
  TableWidget( {required this.listRow});
List<ContractMaterialModel> listRow;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: EasyTable(
        EasyTableModel<ContractMaterialModel>(rows: listRow, columns: listColumn),
        columnsFit: true,
      ),
    );
  }

  List<EasyTableColumn<ContractMaterialModel>> listColumn = [
    EasyTableColumn<ContractMaterialModel>(
        name: 'السعر الاجمالي',
        headerTextStyle:TextStyleMange.headerTextStyle,
        doubleValue: (row) => row.overallPrice,
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle: TextStyleMange.cellTextStyle),
    EasyTableColumn<ContractMaterialModel>(
        name: 'السعر المفرد',
        doubleValue: (row) => row.individualPrice,
        headerTextStyle: TextStyleMange.headerTextStyle,
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle: TextStyleMange.cellTextStyle),
    EasyTableColumn<ContractMaterialModel>(
        name: 'الكمية',
        headerTextStyle: TextStyleMange.headerTextStyle,
        intValue: ((row) => row.amount),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
         EasyTableColumn<ContractMaterialModel>(
        name: 'الوحدة',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.unit),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
    EasyTableColumn<ContractMaterialModel>(
        name: 'الاسم',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.name),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
    EasyTableColumn<ContractMaterialModel>(
        name: 'الرقم',
        headerTextStyle: TextStyleMange.headerTextStyle,
        intValue: ((row) => row.num),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
  ];
}
