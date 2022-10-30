import 'package:contracts/core/resources/routes_manager.dart';
import 'package:contracts/core/resources/text_style_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/const.dart';

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text('البحث عن عقد',style: TextStyleMange.buttonTextStyle.copyWith(color: Colors.white),),
                      Lottie.asset(AssetJson.search,height: SizeManage.screen.width/3,),
                     
                    ],
                  ),
                  
                  const VerticalDivider(color: Colors.white,thickness: 3,),
                  GestureDetector(
             
                    onTap: (){
                      Navigator.pushNamed(context, Routes.contractMaterial);
                    },
                    child: Column(
                      children: [
                         Text('اضافة عقد جديد',style: TextStyleMange.buttonTextStyle.copyWith(color: Colors.white),),
                        Lottie.asset(AssetJson.add,height:  SizeManage.screen.width/3),
                       
                      ],
                    ),
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
