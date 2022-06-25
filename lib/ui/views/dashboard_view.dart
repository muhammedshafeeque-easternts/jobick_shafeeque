import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';
import 'package:jobick_shafeeque/core/res/constants.dart';
import 'package:jobick_shafeeque/core/res/responsive.dart';
import 'package:jobick_shafeeque/core/res/size_config.dart';
import 'package:jobick_shafeeque/core/viewmodels/dashboard_viewmodel.dart';
import 'package:jobick_shafeeque/core/viewmodels/drawer_controller.dart';
import 'package:jobick_shafeeque/ui/views/add_new_job_view.dart';
import 'package:jobick_shafeeque/ui/widgets/custom_icon_button_widget.dart';
import 'package:jobick_shafeeque/ui/widgets/side_menu.dart';
import 'package:provider/provider.dart';
import '../widgets/header_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 5);

  @override
  void initState() {
    super.initState();
    // Provider.of<DashBoardViewModel>(context, listen: false).initialize();
    context.read<DashBoardViewModel>().initialize();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
                              Header(onTapAddJob: () {
                                _navigateToAddNewJobScreen(context,
                                    isEditMode: false);
                              }),
                              const SizedBox(height: defaultPadding),
                              // TableData(),
                              Scrollbar(
                                  controller: _scrollController,
                                  scrollbarOrientation:
                                      ScrollbarOrientation.bottom,
                                  thickness: 3,
                                  showTrackOnHover: true,
                                  radius: const Radius.circular(20),
                                  trackVisibility: true,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollController,
                                      child: _getDataTable(context))),
                              Consumer<DashBoardViewModel>(
                                  builder: (context, model, child) {
                                return Visibility(
                                  visible: model.tableValues != null &&
                                      model.tableValues!.length > 1,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Showing 1 of 9 of 9 entries",
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {},
                                              child: const Text("Previous"),
                                              style: TextButton.styleFrom(
                                                  primary: kButtonColor,
                                                  side: const BorderSide(
                                                      color: kButtonColor),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)))),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            child:
                                                const Center(child: Text('1')),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.grey[300],
                                                border: Border.all(
                                                    color: Colors.blueGrey)),
                                            // padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          OutlinedButton(
                                              onPressed: () {},
                                              child: const Text("Next"),
                                              style: TextButton.styleFrom(
                                                  primary: kButtonColor,
                                                  side: const BorderSide(
                                                      color: kButtonColor),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)))),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.red,
            onPressed: () {},
            child: const Icon(
              Icons.next_plan_outlined,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.blue,
            onPressed: () {},
            child: const Icon(Icons.headset_mic),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.green,
            onPressed: () {},
            child: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }

  void _navigateToAddNewJobScreen(BuildContext context,
      {bool isEditMode = false, Job? tableRow}) {
    showDialog(
        context: context,
        builder: (_) {
          return Responsive.isDesktop(context)
              ? Dialog(
                  // contentPadding: EdgeInsets.all(10.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: SizedBox(
                    width: Responsive.screenWidth(context) * .7,
                    height: Responsive.screenHeight(context) * .7,
                    child: AddNewJobView(
                        isEditMode: isEditMode, tableData: tableRow),
                  ))
              : AddNewJobView(isEditMode: isEditMode, tableData: tableRow);
        }).then((value) {
      if (value == null || !value) return;
      Provider.of<DashBoardViewModel>(context, listen: false).getAllJobs();
    });
  }

  Widget _getDataTable(BuildContext context) {
    debugPrint('data table rebuild');
    final popupItemTextTheme = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.bold);
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultPadding),
            bottomLeft: Radius.circular(defaultPadding)),
      ),
      child: Consumer<DashBoardViewModel>(builder: (context, model, child) {
        return ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: Responsive.isDesktop(context)
                    ? Responsive.screenWidth(context) * .82
                    : Responsive.isTablet(context)
                        ? Responsive.screenWidth(context) * 1.7
                        : Responsive.screenWidth(context) * 3,
                maxWidth: Responsive.isDesktop(context)
                    ? Responsive.screenWidth(context) * .82
                    : Responsive.isTablet(context)
                        ? Responsive.screenWidth(context) * 1.7
                        : Responsive.screenWidth(context) * 3,
                minHeight: /*tableValues == null || tableValues.length == 1
                      ? Responsive.screenHeight(context) * .65
                      :*/
                    Responsive.screenHeight(context) * .65),
            child: model.tableValues == null
                ? const CupertinoActivityIndicator()
                : model.tableValues!.length == 1
                    ? const Center(
                        child: Text('No Jobs Found'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.tableValues!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var item = model.tableValues![index];
                          return Column(
                            children: [
                              ColoredBox(
                                color:
                                    index.isEven ? kRowColorOdd : kRowColorEven,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding * 2),
                                  child: ConstrainedBox(
                                    // width:Responsive.screenWidth(context)*2,

                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              item.columnId == 1
                                                  ? 'No'
                                                  : '${item.columnId! - 1}',
                                              style: TextStyle(
                                                  fontWeight:
                                                      item.columnIsTitle!
                                                          ? FontWeight.bold
                                                          : FontWeight.w500),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              item.columnPosition!,
                                              style: TextStyle(
                                                  fontWeight:
                                                      item.columnIsTitle!
                                                          ? FontWeight.w900
                                                          : FontWeight.w500),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              item.columnType!,
                                              style: TextStyle(
                                                  fontWeight:
                                                      item.columnIsTitle!
                                                          ? FontWeight.bold
                                                          : FontWeight.w500),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              item.columnPostedDate!,
                                              style: TextStyle(
                                                  fontWeight:
                                                      item.columnIsTitle!
                                                          ? FontWeight.bold
                                                          : FontWeight.w500),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              item.columnLastDateToApply!,
                                              style: TextStyle(
                                                  fontWeight:
                                                      item.columnIsTitle!
                                                          ? FontWeight.bold
                                                          : FontWeight.w500),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              item.columnCloseDate!,
                                              style: TextStyle(
                                                  fontWeight:
                                                      item.columnIsTitle!
                                                          ? FontWeight.bold
                                                          : FontWeight.w500),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Container(
                                                  // padding: EdgeInsets.symmetric(horizontal:20,vertical:defaultPadding/3 ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            36),
                                                    color: item.columnIsTitle!
                                                        ? null
                                                        : item.columnStatus ==
                                                                'Active'
                                                            ? Colors
                                                                .green.shade100
                                                            : Colors
                                                                .pink.shade100,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      item.columnStatus!,
                                                      style: TextStyle(
                                                          fontWeight: item
                                                                  .columnIsTitle!
                                                              ? FontWeight.bold
                                                              : FontWeight.w500,
                                                          color: item
                                                                  .columnIsTitle!
                                                              ? null
                                                              : item.columnStatus ==
                                                                      'Active'
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .pink),
                                                    ),
                                                  ),
                                                  width: Responsive.isDesktop(
                                                          context)
                                                      ? Responsive.screenWidth(
                                                              context) *
                                                          .05
                                                      : Responsive.screenWidth(
                                                              context) *
                                                          .18,
                                                  height:
                                                      Responsive.screenHeight(
                                                              context) *
                                                          .035,
                                                ),
                                                // SizedBox(width: 0,)
                                              ],
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Text(
                                                  item.columnActions ?? '',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          item.columnIsTitle!
                                                              ? FontWeight.bold
                                                              : null),
                                                ),
                                                Visibility(
                                                  visible: item.columnActions ==
                                                      null,
                                                  child: Row(
                                                    children: [
                                                      CustomIconButtonWidget(
                                                          horizontalPadding: 5,
                                                          verticalPadding: 5,
                                                          icon:
                                                              Icons.visibility,
                                                          backgroundColor:
                                                              Colors.green
                                                                  .shade100,
                                                          iconColor:
                                                              Colors.green,
                                                          onTap: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) {
                                                                  /*return Responsive.isDesktop(context)
                                                                        ?*/
                                                                  return Dialog(
                                                                      // contentPadding: EdgeInsets.all(10.0),
                                                                      elevation:
                                                                          5,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20.0)),
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          top:
                                                                              20,
                                                                        ),
                                                                        // width: Responsive.screenWidth(context) * .5,
                                                                        height:
                                                                            Responsive.screenHeight(context) *
                                                                                .5,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                height10(),
                                                                                Text(
                                                                                  'Position',
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  'Type',
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  'Posted Date',
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  'Last Date To Apply',
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  'Close Date',
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                height10(),
                                                                                Text(
                                                                                  item.columnPosition!,
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  item.columnType!,
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  item.columnPostedDate!,
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  item.columnLastDateToApply!,
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                height10(),
                                                                                Text(
                                                                                  item.columnCloseDate!,
                                                                                  style: popupItemTextTheme,
                                                                                ),
                                                                                // height10(),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )
                                                                      // AddNewJobScreen()
                                                                      );
                                                                  // : AddNewJobScreen(isEditMode: isEditMode, tableData: tableRow);
                                                                });
                                                          }),
                                                      SizedBox(
                                                        width: Responsive
                                                                .screenWidth(
                                                                    context) *
                                                            .01,
                                                      ),
                                                      CustomIconButtonWidget(
                                                          horizontalPadding: 5,
                                                          verticalPadding: 5,
                                                          icon: Icons.edit,
                                                          backgroundColor:
                                                              Colors.blueGrey
                                                                  .shade100,
                                                          iconColor:
                                                              Colors.blueGrey,
                                                          onTap: () {
                                                            _navigateToAddNewJobScreen(
                                                                context,
                                                                isEditMode:
                                                                    true,
                                                                tableRow: item);
                                                          }),
                                                      SizedBox(
                                                        width: Responsive
                                                                .screenWidth(
                                                                    context) *
                                                            .01,
                                                      ),
                                                      CustomIconButtonWidget(
                                                          horizontalPadding: 5,
                                                          verticalPadding: 5,
                                                          icon: Icons.delete,
                                                          backgroundColor:
                                                              Colors.pink
                                                                  .shade100,
                                                          iconColor:
                                                              Colors.pink,
                                                          onTap: () {
                                                            model.deleteJob(
                                                                item);
                                                          }),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        minHeight:
                                            Responsive.screenHeight(context) *
                                                .07),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: index == model.tableValues!.length - 1
                                    ? false
                                    : true,
                                child: const Divider(
                                  height: 0,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          );
                        }));
      }),
    );
  }
}
