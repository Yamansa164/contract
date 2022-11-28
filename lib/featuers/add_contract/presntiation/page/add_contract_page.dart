import 'package:contracts/core/resources/assets_manager.dart';
import 'package:contracts/core/resources/const.dart';
import 'package:contracts/core/resources/routes_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/resources/color_manager.dart';
import '../bloc/add_contract_bloc.dart';
import '../widget/add_contract_widget.dart';
import '../widget/add_material_widget.dart';
import '../../../../core/widget/lottie_widget.dart';
import '../widget/table_item_widget.dart';

class AddContractPage extends StatelessWidget {
  const AddContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddContractBloc bloc = AddContractBloc.getBloc(context);
    return Scaffold(
        body: Container(
      color: ColorManage.primery,
      width: SizeManage.screen.width,
      height: SizeManage.screen.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeManage.screen.width - 130),
              child: Image.asset(
                Assetimage.logo,
                height: SizeManage.screen.height / 9,
              ),
            ),
            BlocBuilder<AddContractBloc, AddContractState>(
              builder: (context, state) {
                if (state is AddContractst) {
                  return Lottie.asset(AssetJson.contract,
                      height: SizeManage.screen.height / 6);
                } else {
                  return Lottie.asset(AssetJson.truck,
                      height: SizeManage.screen.height / 6);
                }
              },
            ),
            SizedBox(
              height: SizeManage.screen.height / 100,
            ),
            BlocBuilder<AddContractBloc, AddContractState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return LottieWidget(
                      text: 'Loading...',
                      lottie: AssetJson.loading,
                      onPressed: () {});
                } else if (state is AddContractst) {
                  return AddContractWidget(
                    bloc: bloc,
                  );
                } else if (state is TableItemState) {
                  return AddContractTableItemWidget(
                    bloc: bloc,
                  );
                } else if (state is AddContractMaterialState) {
                  return AddMaterialToContractWidget(
                    bloc: bloc,
                  );
                } else if (state is AddContractError) {
                  return LottieWidget(
                    text: state.message,
                    lottie: AssetJson.error,
                    onPressed: () {
                      AddContractBloc.getBloc(context).add(GoToAddContract());
                    },
                  );
                } else if (state is AddContractError) {
                  return LottieWidget(
                    text: ' تعذر اضافة العقد',
                    lottie: AssetJson.error,
                    onPressed: () {
                      AddContractBloc.getBloc(context).add(GoToAddContract());
                    },
                  );
                } else if (state is AddContractSuccess) {
                  return LottieWidget(
                    text: 'تم اضافة العقد بنجاح',
                    lottie: AssetJson.success,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, Routes.homeScreen);
                    },
                  );
                } else {
                  return LottieWidget(
                    text: 'SomeThing Get Wrong',
                    lottie: AssetJson.error,
                    onPressed: () {
                      AddContractBloc.getBloc(context).add(GoToAddContract());
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
