

import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/screens/add_new_job_screen/add_new_job_screen.dart';
import 'package:jobick_shafeeque/screens/main/main_screen.dart';

class AppRoutes {
  static const homeScreen = "/";
  static const addNewJobScreen = "add_new_job_screen";


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case homeScreen:
              return  MainScreen();
              case addNewJobScreen:
              return  const AddNewJobScreen();
            default:
              return const Text("Route Erro");
          }
        });
  }
}
