import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/core/res/responsive.dart';
import 'package:jobick_shafeeque/ui/widgets/app_bar.dart';
import 'package:jobick_shafeeque/ui/widgets/side_menu.dart';
import 'dashboard_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                child: const AppBarWidget(showDrawer: true),
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: Responsive.isDesktop(context) ? 20 : 6)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We want this side menu only for large screen
                  if (Responsive.isDesktop(context))
                    const Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenu(),
                    ),
                   const Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: DashboardView(),
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
