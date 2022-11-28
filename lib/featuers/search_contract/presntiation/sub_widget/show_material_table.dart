
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/resources/text_style_manager.dart';


// ignore: must_be_immutable
class MaterialTable extends StatelessWidget {
  MaterialTable( {super.key, required this.listRow});
List<MaterialModel> listRow;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: EasyTable<MaterialModel>(
        EasyTableModel<MaterialModel>(rows: listRow, columns: listColumn),
        columnsFit: true,
      ),
    );
  }

  List<EasyTableColumn<MaterialModel>> listColumn = [
  
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
        intValue: ((row) => (row.amount-row.newAmount)),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
          EasyTableColumn<MaterialModel>(
        name: 'الكمية المستهلكة' ,
        headerTextStyle: TextStyleMange.headerTextStyle,
        intValue: ((row) => row.newAmount),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
    EasyTableColumn<MaterialModel>(
        name: 'الكمية الكلية',
        headerTextStyle: TextStyleMange.headerTextStyle,
        intValue: ((row) => row.amount),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
         EasyTableColumn<MaterialModel>(
        name: 'الوحدة',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.unit),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
    EasyTableColumn<MaterialModel>(
        name: 'الاسم',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.name),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
    EasyTableColumn<MaterialModel>(
        name: 'الرقم',
        headerTextStyle: TextStyleMange.headerTextStyle,
        stringValue: ((row) => row.number),
        headerAlignment: Alignment.center,
        cellAlignment: Alignment.center,
        cellTextStyle:TextStyleMange.cellTextStyle),
  ];
}
