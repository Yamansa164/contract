import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';

class ShowStatementsWidget extends StatelessWidget {
  ShowStatementsWidget({super.key, required this.bloc});
  ContractBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: DecorationManage.tableDecoration,
          height: SizeManage.screen.height / 2,
          width: SizeManage.screen.width - 400,
          child: Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                itemCount: bloc.listStatementModel!.listStatement.length,
                padding: EdgeInsets.all(SizeManage.screen.height / 100),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(bloc.listStatementModel!.listStatement[index]
                          .overallPrice);
                    },
                    child: Container(
                      color: Colors.white,
                      height: 30,
                      child: Center(
                        child: Text(
                          'الكشف رقم ${bloc.listStatementModel!.listStatement[index].id}',
                          style: TextStyle(color: ColorManage.primery),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeManage.screen.height / 60,
        ),
        NewButton(
          width: 6,
          buttonName: 'الرجوع',
          color: ColorManage.second,
          onPressed: () {
            bloc.add(DoSearchContractEvent());
          },
        )
      ],
    );
  }
}
