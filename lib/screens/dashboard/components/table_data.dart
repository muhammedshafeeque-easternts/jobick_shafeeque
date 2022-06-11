import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/models/table_model.dart';
import 'package:jobick_shafeeque/responsive.dart';

import '../../../constants.dart';

class TableData extends StatelessWidget {
  const TableData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 0,
              dataRowHeight: Responsive.screenHeight(context) * .08,
              // minWidth: Responsive.screenWidth(context)*4,
              headingRowHeight: 0,
              columns: [
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index], context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(TableModel fileInfo, BuildContext context) {
  return DataRow(
    color: MaterialStateColor.resolveWith(
      (states) {
        return demoRecentFiles.indexOf(fileInfo).isEven
            // int.parse(user.fDateFormated.substring(0,2)).isEven
            ? kRowColorEven
            : kRowColorOdd;
      },
    ),
    cells: [
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .2,
          child: Padding(
            padding: const EdgeInsets.only(left:defaultPadding),
            child: Text(
              fileInfo.no!,
              style: TextStyle(
                  fontWeight:
                      fileInfo.isTitle ? FontWeight.bold : FontWeight.normal),
            ),
          ))),
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .45,
          child: Text(
            fileInfo.position!,
            style: TextStyle(
                fontWeight:
                    fileInfo.isTitle ? FontWeight.bold : FontWeight.normal),
          ))),
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .35,
          child: Text(
            fileInfo.type!,
            style: TextStyle(
                fontWeight:
                    fileInfo.isTitle ? FontWeight.bold : FontWeight.normal),
          ))),
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .35,
          child: Text(
            fileInfo.postedDate!,
            style: TextStyle(
                fontWeight:
                    fileInfo.isTitle ? FontWeight.bold : FontWeight.normal),
          ))),
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .35,
          child: Text(
            fileInfo.lastDateToApply!,
            style: TextStyle(
                fontWeight:
                    fileInfo.isTitle ? FontWeight.bold : FontWeight.normal),
          ))),
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .35,
          child: Text(
            fileInfo.closeDate!,
            style: TextStyle(
                fontWeight:
                    fileInfo.isTitle ? FontWeight.bold : FontWeight.normal),
          ))),
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .35,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding / 4,
                    vertical: defaultPadding / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: fileInfo.isTitle
                      ? null
                      : fileInfo.status == 'Active'
                          ? Colors.green.shade100
                          : Colors.pink.shade100,
                ),
                child: Text(
                  fileInfo.status!,
                  style: TextStyle(
                      fontWeight:
                          fileInfo.isTitle ? FontWeight.bold : FontWeight.w500,
                      color: fileInfo.isTitle
                          ? null
                          : fileInfo.status == 'Active'
                              ? Colors.green
                              : Colors.pink),
                ),
              ),
              // SizedBox(width: 0,)
            ],
          ))),
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .45,
          child: Row(
            children: [
              Text(
                fileInfo.actions ?? '',
                style: TextStyle(
                    fontWeight:
                        fileInfo.isTitle ? FontWeight.bold : FontWeight.normal),
              ),
              Visibility(
                visible: fileInfo.actions == null,
                child: Row(
                  children: [
                    CustomIconButtonWidget(
                        icon: Icons.visibility,
                        backgroundColor: Colors.green.shade100,
                        iconColor: Colors.green,onTap: (){}),
                    SizedBox(
                      width: Responsive.screenWidth(context) * .02,
                    ),
                    CustomIconButtonWidget(
                        icon: Icons.edit,
                        backgroundColor: Colors.blueGrey.shade100,
                        iconColor: Colors.blueGrey,onTap: (){}),
                    SizedBox(
                      width: Responsive.screenWidth(context) * .02,
                    ),
                    CustomIconButtonWidget(
                        icon: Icons.delete,
                        backgroundColor: Colors.pink.shade100,
                        iconColor: Colors.pink,onTap: (){}),
                  ],
                ),
              )
            ],
          ))),
    ],
  );
}

class CustomIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double boarderRadius;
  final double horizontalPadding;
  final double verticalPadding;

  final VoidCallback onTap;
  const CustomIconButtonWidget(
      {Key? key,
      required this.icon,
      required this.backgroundColor,
      required this.iconColor, this.boarderRadius=36,this.horizontalPadding=10,this.verticalPadding=10,required this.onTap
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Icon(icon, color: iconColor),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boarderRadius),
          color: backgroundColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
      ),
    );
  }
}
