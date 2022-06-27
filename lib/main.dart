import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/core/res/routes.dart';
import 'package:jobick_shafeeque/core/viewmodels/dashboard_viewmodel.dart';
import 'package:jobick_shafeeque/core/viewmodels/drawer_controller.dart';
import 'package:provider/provider.dart';
import 'package:jobick_shafeeque/locator.dart'  as locator;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await locator.setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
        Provider<DashBoardViewModel>(
          create: (_) => locator.sl<DashBoardViewModel>(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.homeScreen,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}