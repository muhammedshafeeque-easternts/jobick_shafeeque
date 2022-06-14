import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/constants.dart';
import 'package:jobick_shafeeque/controllers/drawer_controller.dart';
import 'package:jobick_shafeeque/screens/main/components/side_menu.dart';
import 'package:jobick_shafeeque/widgets/custom_data_table_widget.dart';
import 'package:provider/provider.dart';
import 'components/header_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 5);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const SizedBox(height: defaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              const Header(),
                              const SizedBox(height: defaultPadding),
                              // TableData(),
                              Scrollbar(
                                  controller: scrollController,
                                  scrollbarOrientation:
                                      ScrollbarOrientation.bottom,
                                  thickness: 3,
                                  showTrackOnHover: true,
                                  radius: const Radius.circular(20),
                                  trackVisibility: true,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: scrollController,
                                      child: const CustomTable())),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


