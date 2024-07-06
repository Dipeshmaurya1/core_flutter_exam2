import 'package:core_flutter_exam2/Home/addPage.dart';
import 'package:flutter/material.dart';

import '../Home/homePage.dart';
class AppRoutes{
  static Map<String,Widget Function(BuildContext)>routes=
  {
    '/':(context)=>HomeScreen(),
    '/add':(context)=>AddPage(),
  };
}