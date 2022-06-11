
import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/controllers/drawer_controller.dart';
import 'package:jobick_shafeeque/responsive.dart';
import 'package:jobick_shafeeque/screens/dashboard/components/app_bar.dart';
import 'package:provider/provider.dart';

import '../dashboard/dashboard_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      // drawer: SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                child: AppBarWidget(showDrawer: true),
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: Responsive.isDesktop(context)? 20:6)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We want this side menu only for large screen
                  if (Responsive.isDesktop(context))
                    Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenu(),
                    ),
                  Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: DashboardScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
