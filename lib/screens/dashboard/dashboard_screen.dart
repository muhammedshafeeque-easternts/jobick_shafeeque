import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/constants.dart';
import 'package:jobick_shafeeque/controllers/drawer_controller.dart';
import 'package:jobick_shafeeque/models/table_model.dart';
import 'package:jobick_shafeeque/responsive.dart';
import 'package:jobick_shafeeque/screens/main/components/side_menu.dart';
import 'package:provider/provider.dart';
import 'components/header_widget.dart';
import 'components/table_data.dart';

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
                            children:  [
                              const Header(),
                              const SizedBox(height: defaultPadding),
                              // TableData(),
                              Scrollbar(
                                  controller: scrollController,
                                  thickness: 3,
                                  showTrackOnHover: true,
                                  radius: const Radius.circular(20),
                                  trackVisibility: true,
                                  child: const SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: CustomTable())),
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




class CustomTable extends StatelessWidget {
  const CustomTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultPadding),
            bottomLeft:
                Radius.circular(defaultPadding)),
      ),
      child: SizedBox(
        width: !Responsive.isDesktop(context)?Responsive.screenWidth(context) * 3:Responsive.screenWidth(context)*.82,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: tableFiles.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder:
                (BuildContext context, int index) {
              var item = tableFiles[index];
              return Column(
                children: [
                  ColoredBox(
                    color: index.isEven
                        ? kRowColorOdd
                        : kRowColorEven,
                    child: Padding(
                      padding: const EdgeInsets
                              .symmetric(
                          horizontal:
                              defaultPadding * 2),
                      child: ConstrainedBox(
                        // width:Responsive.screenWidth(context)*2,

                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  item.no!,
                                  style: TextStyle(
                                      fontWeight: item
                                              .isTitle
                                          ? FontWeight
                                              .bold
                                          : FontWeight
                                          .w500),
                                )),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  item.position!,
                                  style: TextStyle(
                                      fontWeight: item
                                              .isTitle
                                          ? FontWeight
                                              .w900
                                          : FontWeight
                                          .w500),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  item.type!,
                                  style: TextStyle(
                                      fontWeight: item
                                              .isTitle
                                          ? FontWeight
                                              .bold
                                          : FontWeight
                                          .w500),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  item.postedDate!,
                                  style: TextStyle(
                                      fontWeight: item
                                              .isTitle
                                          ? FontWeight
                                              .bold
                                          : FontWeight
                                          .w500),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  item.lastDateToApply!,
                                  style: TextStyle(
                                      fontWeight: item
                                              .isTitle
                                          ? FontWeight
                                              .bold
                                          : FontWeight
                                          .w500),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  item.closeDate!,
                                  style: TextStyle(
                                      fontWeight: item
                                              .isTitle
                                          ? FontWeight
                                              .bold
                                          : FontWeight
                                          .w500),
                                )),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.symmetric(horizontal:20,vertical:defaultPadding/3 ),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),color: item.isTitle?null:
                                      item.status=='Active'?Colors.green.shade100:Colors.pink.shade100,),
                                      child: Center(
                                        child: Text(
                                          item.status!,
                                          style: TextStyle(
                                              fontWeight:
                                              item.isTitle ? FontWeight.bold : FontWeight.w500,color:item.isTitle?null:
                                          item.status=='Active'?Colors.green:Colors.pink),
                                        ),
                                      ),
                                      width: Responsive.isDesktop(context)?Responsive.screenWidth(context)*.05:Responsive.screenWidth(context)*.18,
                                      height: Responsive.screenHeight(context)*.035,
                                    ),
                                    // SizedBox(width: 0,)
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Text(
                                      item.actions ??
                                          '',
                                      style: TextStyle(
                                          fontWeight: item
                                                  .isTitle
                                              ? FontWeight
                                                  .bold
                                              : null),
                                    ),
                                    Visibility(
                                      visible: item.actions==null,
                                      child: Row(
                                        children: [
                                          CustomIconButtonWidget(horizontalPadding: 5,verticalPadding:5,icon: Icons.visibility,backgroundColor: Colors.green.shade100,iconColor:Colors.green,onTap: (){}),
                                          SizedBox(width: Responsive.screenWidth(context)*.01,),
                                          CustomIconButtonWidget(horizontalPadding: 5,verticalPadding:5,icon: Icons.edit,backgroundColor: Colors.blueGrey.shade100,iconColor:Colors.blueGrey,onTap: (){}),
                                          SizedBox(width: Responsive.screenWidth(context)*.01,),
                                          CustomIconButtonWidget(horizontalPadding: 5,verticalPadding:5,icon: Icons.delete,backgroundColor: Colors.pink.shade100,iconColor:Colors.pink,onTap: (){}),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        constraints: BoxConstraints(
                            maxWidth:
                                double.infinity,
                            minHeight: Responsive
                                    .screenHeight(
                                        context) *
                                .07),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: index ==
                            tableFiles.length -
                                1
                        ? false
                        : true,
                    child: const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                  ),
                ],
              );
            }),
        // height: height * 0.97/4,
      ),
    );
  }
}
