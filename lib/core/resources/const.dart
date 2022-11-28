import 'package:flutter/material.dart';

class SizeManage {
  static Size screen =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
}

class ConstManage {
  static String url = 'http://127.0.0.1:8000/api';
 static const List<String> excutingAgenceItems = [
    'مؤوسسة الاسكان العسكري-فرع 7',
    'شركة التيناوي للمقاولات',
    'شركة عامر الجلاب للمقاولات',
    'الشركة العامة للبناء والتعمير'
  ];
static  const List<String> addressItems = [
    'ضاحية الفيحاء السكنية',
    'مدينة الديماس الجديدة',
    'اللاذقية-اوتستراد الثورة',
    'طرطوس-عقدة الشيخ سعد',
    'ضاحية عدرا العمالية',
  ];
  static const List<String> branchItems = [
    'فرع دمشق',
    'فرع اللاذقية',
    'فرع طرطوس',
    'فرع حلب',
    'فرع عدرا',
    'فرع المنطقة الجنوبية'
  ];
 static const List<String> watchingAgenceItems = [
    'جهاز اشراف محلي',
    'الشركة العامة للدراسات',
  ];
}
