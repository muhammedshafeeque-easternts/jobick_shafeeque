

import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/ui/views/add_new_job_view.dart';
import 'package:jobick_shafeeque/ui/views/main_view.dart';


class AppRoutes {
  static const homeScreen = "/";
  static const addNewJobScreen = "add_new_job_screen";


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case homeScreen:
              return  const MainView();
              case addNewJobScreen:
              return  const AddNewJobView(isEditMode: false,);
            default:
              return const Text("Route Erro");
          }
        });
  }
}
