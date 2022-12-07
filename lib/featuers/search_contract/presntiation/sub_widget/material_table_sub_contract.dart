import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/text_style_manager.dart';
import '../../domain/entities/list_contract_model.dart';
import '../bloc/contract_bloc.dart';

class MaterialTableSubContract extends StatelessWidget {
  const MaterialTableSubContract({super.key, required this.bloc});

  final ContractBloc bloc;
  @override
  Widget build(BuildContext context) {
    List<EasyTableColumn<MaterialModel>> listColumn = [
      EasyTableColumn<MaterialModel>(
          name: 'السعر الاجمالي ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          cellBuilder: (context, data) {
            return Text(
                (data.row.individualPrice * data.row.newQuantity).toString());
          },
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'السعر الافرادي ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          cellBuilder: (context, data) {
            return Text('${data.row.individualPrice}');
          },
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
      EasyTableColumn<MaterialModel>(
          name: 'الكمية ',
          headerTextStyle: TextStyleMange.headerTextStyle,
          cellBuilder: (context, data) {
            return Text('${data.row.newQuantity}');
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
          stringValue: ((row) => row.number),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyleMange.cellTextStyle),
    ];
    return Material(
      type: MaterialType.transparency,
      child: EasyTable(
        EasyTableModel<MaterialModel>(
            rows: bloc.listMaterialToAddToSubContract, columns: listColumn),
        columnsFit: true,
      ),
    );
  }
}
