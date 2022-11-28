import 'package:contracts/core/widget/lottie_widget.dart';
import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/add_contract/presntiation/bloc/add_contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/search_contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/contract_table.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/drop_down_item.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/add_new_material.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/add_statements.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/table_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/const.dart';
import '../../../../core/resources/decoration_manager.dart';
import '../../../../core/resources/text_style_manager.dart';
import '../../../../core/widget/row_text_field.dart';
import '../widget/search_container.dart';

class SearchContract extends StatelessWidget {
  const SearchContract({super.key});

  @override
  Widget build(BuildContext context) {
    SearchContractBloc bloc = SearchContractBloc.getBloc(context);

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
            BlocBuilder<SearchContractBloc, SearchContractState>(
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
            BlocBuilder<SearchContractBloc, SearchContractState>(
              builder: (context, state) {
                if (state is SearchContractInitial) {
                  return SearchContainer(bloc: bloc);
                } else if (state is SearchContractLoading) {
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
                      buttonName: 'الرجوع',
                      onPressed: () {
                        bloc.add(GoBackToSearch());
                      },
                      bloc: bloc,
                      tableWidget: SearchContractTableWidget(bloc: bloc),
                    );
                  }
                } else if (state is AddStatementsInitial) {
                  return AddStatementsWidget(
                    bloc: bloc,
                  );
                } else if (state is AddStatementsMaterialInitial) {
                  return AddNewMaterialToStatements(bloc: bloc);
                } else if (state is AddStatementsMaterialFaield) {
                  return LottieWidget(
                      text: state.message,
                      lottie: AssetJson.empty,
                      onPressed: () {
                        bloc.add(GoToAddStatementsMaterialEvent());
                      });
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
