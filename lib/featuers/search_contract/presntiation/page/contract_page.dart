import 'package:contracts/core/widget/lottie_widget.dart';
import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/contract_table.dart';

import 'package:contracts/featuers/search_contract/presntiation/widget/statement/select_material_tostatements.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/statement/add_statements.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/sub_contract/add_contractMateirla_toSubContract.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/sub_contract/add_otherMaterail_toSubContract.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/sub_contract/add_subcontract_widget.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/table_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/const.dart';
import '../../../../core/resources/routes_manager.dart';

import '../widget/search_contract/search_container.dart';
import '../widget/show_material/show_material_table_item.dart';
import '../widget/statement/show_statements.dart';
import '../widget/sub_contract/add_material_toSubContract.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContractBloc bloc = ContractBloc.getBloc(context);

    return Scaffold(
      body: Container(
        color: ColorManage.primery,
        width: SizeManage.screen.width,
        height: SizeManage.screen.height,
        child: SingleChildScrollView(
          // reverse: true,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: SizeManage.screen.width - 130),
              child: Image.asset(
                Assetimage.logo,
                height: SizeManage.screen.height / 9,
              ),
            ),
            BlocBuilder<ContractBloc, ContractState>(
              builder: (context, state) {
                if (state is AddStatementsInitial) {
                  return Lottie.asset(AssetJson.contract,
                      height: SizeManage.screen.height / 4);
                } else if (state is AddStatementsMaterialInitial) {
                  return Lottie.asset(AssetJson.truck,
                      height: SizeManage.screen.height / 4);
                } else {
                  return Lottie.asset(AssetJson.search,
                      height: SizeManage.screen.height / 4);
                }
              },
            ),
            BlocBuilder<ContractBloc, ContractState>(
              builder: (context, state) {
                if (state is SearchContractInitial) {
                  return SearchContainer(bloc: bloc);
                } else if (state is LoadingState) {
                  return LottieWidget(
                    text: 'Loading',
                    lottie: AssetJson.loading,
                    onPressed: () {},
                  );
                } else if (state is SearchContractFaield) {
                  return LottieWidget(
                      text: state.failuer.message,
                      lottie: AssetJson.error,
                      onPressed: () {
                        bloc.add(GoBackToSearch());
                      });
                } else if (state is SearchContractsuccess) {
                  if (state.listContracts.contract.isEmpty) {
                    return LottieWidget(
                        text: 'لايوجد عقد بالمعلومات المدخلة',
                        lottie: AssetJson.empty,
                        onPressed: () {
                          bloc.add(GoBackToSearch());
                        });
                  } else {
                    bloc.listContractsModel = state.listContracts;
                    return TableItemWidget(
                      listWidget: [
                        NewButton(
                          width: 6,
                          buttonName: 'الرجوع',
                          color: ColorManage.second,
                          onPressed: () {
                            bloc.add(GoBackToSearch());
                          },
                        )
                      ],
                      tableWidget: SearchContractTableWidget(bloc: bloc),
                    );
                  }
                } else if (state is AddStatementsInitial) {
                  return AddStatementsWidget(
                    bloc: bloc,
                  );
                } else if (state is AddStatementsMaterialInitial) {
                  return SelectMaterialToStatements(bloc: bloc);
                } else if (state is AddStatementsMaterialFaield) {
                  return LottieWidget(
                      text: state.message,
                      lottie: AssetJson.empty,
                      onPressed: () {
                        bloc.add(GoToAddStatementsMaterialEvent());
                      });
                } else if (state is AddStatementsFaield) {
                  return LottieWidget(
                    text: state.failuer.message,
                    lottie: AssetJson.error,
                    onPressed: () {
                      bloc.add(GoToAddStatementsEvent());
                    },
                  );
                } else if (state is AddStatementssuccess) {
                  return LottieWidget(
                    text: 'تم اضافة الكشف بنجاح',
                    lottie: AssetJson.success,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, Routes.homeScreen);
                    },
                  );
                } else if (state is MaterialTableInitial) {
                  return MaterialTableItemWidget(
                      bloc: bloc, listRow: state.listRow);
                } else if (state is GetStatementsFaield) {
                  return LottieWidget(
                      text: state.failuer.message,
                      lottie: AssetJson.error,
                      onPressed: () {
                        bloc.add(DoSearchContractEvent());
                      });
                } else if (state is GetStatementsSuccess) {
                  bloc.listStatementModel = state.listStatementModel;
                  return ShowStatementsWidget(
                    bloc: bloc,
                  );
                } else if (state is AddSubContractInitial) {
                  return AddSubContractWidget(bloc: bloc);
                } else if (state is AddMaterialToSubContractInItial) {
                  return AddMaterialToSubContractWidget(bloc: bloc);
                }
                else if (state is AddContractMaterialToSubContractInitial) {
                  return AddContractMaterialToSubContractWidget(bloc: bloc);
                }
                else if (state is AddOtherMaterialToSubContractIntial) {
                  return AddOtherMaterialToSubContractWidget(bloc: bloc);
                }

                return LottieWidget(
                  text: 'يوجد خطأ ما',
                  lottie: AssetJson.error,
                  onPressed: () {
                    bloc.add(GoBackToSearch());
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
