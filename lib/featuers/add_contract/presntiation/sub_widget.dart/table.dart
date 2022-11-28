
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/resources/text_style_manager.dart';
import '../../domain/entities/contract_material.dart';


// ignore: must_be_immutable
class AddContractTableWidget extends StatelessWidget {
  AddContractTableWidget( {required this.listRow});
List<AddContractMaterialModel> listRow;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: EasyTable(
        EasyTableModel<AddContractMaterialModel>(rows: listRow, columns: listColumn),
        columnsFit: true,
      ),
    );
  }

  List<EasyTableColumn<AddContractMaterialModel>> listColumn = [
    EasyTableColumn<AddContractMaterialModel>(
        name: 'السعر الاجمالي',
        headerTextStyle:TextStyleMange.headerTextStyle,
        doubleValue: (row) => row.overallPrice,
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle: TextStyleMange.cellTextStyle),
    EasyTableColumn<AddContractMaterialModel>(
        name: 'السعر المفرد',
        doubleValue: (row) => row.individualPrice,
        headerTextStyle: TextStyleMange.headerTextStyle,
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle: TextStyleMange.cellTextStyle),
    EasyTableColumn<AddContractMaterialModel>(
        name: 'الكمية',
        headerTextStyle: TextStyleMange.headerTextStyle,
        intValue: ((row) => row.amount),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
         EasyTableColumn<AddContractMaterialModel>(
        name: 'الوحدة',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.unit),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
    EasyTableColumn<AddContractMaterialModel>(
        name: 'الاسم',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.name),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
    EasyTableColumn<AddContractMaterialModel>(
        name: 'الرقم',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.num),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
  ];
}
