import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/constants.dart';
import 'package:jobick_shafeeque/models/table_model.dart';
import 'package:jobick_shafeeque/responsive.dart';
import 'package:jobick_shafeeque/widgets/custom_icon_button_widget.dart';

/*class TableData extends StatelessWidget {
  const TableData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, top: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
              columns: const [
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
                tableFiles.length,
                (index) => recentFileDataRow(tableFiles[index], context),
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
        return tableFiles.indexOf(fileInfo).isEven
            // int.parse(user.fDateFormated.substring(0,2)).isEven
            ? kRowColorEven
            : kRowColorOdd;
      },
    ),
    cells: [
      DataCell(SizedBox(
          width: Responsive.screenWidth(context) * .2,
          child: Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(
              fileInfo.id!,
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
                padding: const EdgeInsets.symmetric(
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
                        iconColor: Colors.green,
                        onTap: () {}),
                    SizedBox(
                      width: Responsive.screenWidth(context) * .02,
                    ),
                    CustomIconButtonWidget(
                        icon: Icons.edit,
                        backgroundColor: Colors.blueGrey.shade100,
                        iconColor: Colors.blueGrey,
                        onTap: () {}),
                    SizedBox(
                      width: Responsive.screenWidth(context) * .02,
                    ),
                    CustomIconButtonWidget(
                        icon: Icons.delete,
                        backgroundColor: Colors.pink.shade100,
                        iconColor: Colors.pink,
                        onTap: () {}),
                  ],
                ),
              )
            ],
          ))),
    ],
  );
}*/
