import 'package:contracts/core/resources/routes_manager.dart';
import 'package:contracts/core/resources/text_style_manager.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/const.dart';
import '../widget/cell_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CellHome(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.searchContract);
                    },
                    text: 'البحث عن عقد',
                    lottie: AssetJson.search,
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 3,
                  ),
                  CellHome(
                    text: 'اضافة عقد جديد',
                    lottie: AssetJson.add,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.contractMaterial);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
