// import 'package:contracts/featuers/search_contract/data/request/add_sub_contract.dart';
// import 'package:flutter/material.dart';

// import '../../../../../core/resources/color_manager.dart';
// import '../../../../../core/resources/const.dart';
// import '../../../../../core/resources/decoration_manager.dart';
// import '../../../../../core/widget/new_button.dart';
// import '../../../../../core/widget/row_drop_down_item.dart';
// import '../../../../../core/widget/row_text_field.dart';
// import '../../../domain/entities/list_contract_model.dart';
// import '../../bloc/contract_bloc.dart';

// class AddContractMaterialToSubContractWidget extends StatelessWidget {
//   AddContractMaterialToSubContractWidget({super.key, required this.bloc});
//   final ContractBloc bloc;

//   final _formKey = GlobalKey<FormState>();
//   Map<String, String> items = {};

//   @override
//   Widget build(BuildContext context) {
//     print('objectxxxxxxxxx');
//     print(bloc.contractsModel!.listMaterial.map((e) => e.name));

//     List.generate(bloc.contractsModel!.listMaterial.length, (index) {
//       if (bloc.contractsModel!.listMaterial[index].subContractNumber == '0') {
//         items.addAll({
//           bloc.contractsModel!.listMaterial[index].number.toString():
//               bloc.contractsModel!.listMaterial[index].name
//         });
//       }
//     });
//     return Form(
//       key: _formKey,
//       child: Container(
//         decoration: DecorationManage.tableDecoration,
//         height: SizeManage.screen.height / 2,
//         width: SizeManage.screen.width / 3,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             RowDropDownItem(
//               items: items,
//               onChanged: (number) {
//                 bloc.setSelectedMaterial(number.toString());
//                 bloc.setMaxAmount(bloc.contractsModel!.listMaterial
//                     .elementAt(bloc.getSelectedMaterial)
//                     .quantity);
//               },
//               title: 'اسم المادة',
//             ),
//             RowTextField(
//               type: 'num',
//               title: ': الكمية',
//               textEditingController: bloc.contractmaterialAmountToSubContract,
//             ),
//             SizedBox(
//               height: SizeManage.screen.height / 50,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 NewButton(
//                   width: 12,
//                   buttonName: 'الرجوع ',
//                   color: ColorManage.primery,
//                   onPressed: () {
//                     bloc.add(GoToAddMaterialToSubContract());
//                   },
//                 ),
//                 NewButton(
//                     width: 12,
//                     buttonName: 'اضافة',
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         MaterialModel materialModel = bloc
//                             .contractsModel!.listMaterial
//                             .elementAt(bloc.getSelectedMaterial);
//                         materialModel.newQuantity = int.parse(
//                             bloc.contractmaterialAmountToSubContract.text);

//                         bloc.listMaterialToAddToSubContract.add(materialModel);
//                         bloc.listContractMaterialToAddToSubContract.add(
//                             ContractMaterialsRequestToSubContract(
//                                 materialId: materialModel.id.toString(),
//                                 quantity: materialModel.newQuantity));
                             
//                         bloc.contractmaterialAmountToSubContract.clear();
//                         bloc.add(GoToAddMaterialToSubContract());
//                       }
//                     },
//                     color: ColorManage.primery)
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
