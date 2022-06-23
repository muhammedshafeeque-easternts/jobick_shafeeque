

/*
class CustomTable extends StatelessWidget {
  final List<TableModel>? tableValues;
  const CustomTable({
    Key? key,required this.tableValues
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultPadding),
            bottomLeft: Radius.circular(defaultPadding)),
      ),
      child: SizedBox(
          width: Responsive.isDesktop(context)
              ? Responsive.screenWidth(context) * .82
              : Responsive.isTablet(context)
              ? Responsive.screenWidth(context) * 1.7
              : Responsive.screenWidth(context) * 3,
          child:tableValues==null?const CupertinoActivityIndicator(): tableValues!.isEmpty?const Center(child: Text('No Jobs Posted'),):ListView.builder(
              shrinkWrap: true,
              itemCount: tableValues!.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = tableValues![index];
                return Column(
                  children: [
                    ColoredBox(
                      color: index.isEven ? kRowColorOdd : kRowColorEven,
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
                                    item.id==1?'No':'${item.id!-1}',
                                    style: TextStyle(
                                        fontWeight: item.isTitle
                                            ? FontWeight.bold
                                            : FontWeight.w500),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    item.position!,
                                    style: TextStyle(
                                        fontWeight: item.isTitle
                                            ? FontWeight.w900
                                            : FontWeight.w500),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    item.type!,
                                    style: TextStyle(
                                        fontWeight: item.isTitle
                                            ? FontWeight.bold
                                            : FontWeight.w500),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    item.postedDate!,
                                    style: TextStyle(
                                        fontWeight: item.isTitle
                                            ? FontWeight.bold
                                            : FontWeight.w500),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    item.lastDateToApply!,
                                    style: TextStyle(
                                        fontWeight: item.isTitle
                                            ? FontWeight.bold
                                            : FontWeight.w500),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    item.closeDate!,
                                    style: TextStyle(
                                        fontWeight: item.isTitle
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
                                          borderRadius: BorderRadius.circular(36),
                                          color: item.isTitle
                                              ? null
                                              : item.status == 'Active'
                                              ? Colors.green.shade100
                                              : Colors.pink.shade100,
                                        ),
                                        child: Center(
                                          child: Text(
                                            item.status!,
                                            style: TextStyle(
                                                fontWeight: item.isTitle
                                                    ? FontWeight.bold
                                                    : FontWeight.w500,
                                                color: item.isTitle
                                                    ? null
                                                    : item.status == 'Active'
                                                    ? Colors.green
                                                    : Colors.pink),
                                          ),
                                        ),
                                        width: Responsive.isDesktop(context)
                                            ? Responsive.screenWidth(context) * .05
                                            : Responsive.screenWidth(context) * .18,
                                        height:
                                        Responsive.screenHeight(context) * .035,
                                      ),
                                      // SizedBox(width: 0,)
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Text(
                                        item.actions ?? '',
                                        style: TextStyle(
                                            fontWeight: item.isTitle
                                                ? FontWeight.bold
                                                : null),
                                      ),
                                      Visibility(
                                        visible: item.actions == null,
                                        child: Row(
                                          children: [
                                            CustomIconButtonWidget(
                                                horizontalPadding: 5,
                                                verticalPadding: 5,
                                                icon: Icons.visibility,
                                                backgroundColor:
                                                Colors.green.shade100,
                                                iconColor: Colors.green,
                                                onTap: () {}),
                                            SizedBox(
                                              width:
                                              Responsive.screenWidth(context) *
                                                  .01,
                                            ),
                                            CustomIconButtonWidget(
                                                horizontalPadding: 5,
                                                verticalPadding: 5,
                                                icon: Icons.edit,
                                                backgroundColor:
                                                Colors.blueGrey.shade100,
                                                iconColor: Colors.blueGrey,
                                                onTap: () {}),
                                            SizedBox(
                                              width:
                                              Responsive.screenWidth(context) *
                                                  .01,
                                            ),
                                            CustomIconButtonWidget(
                                                horizontalPadding: 5,
                                                verticalPadding: 5,
                                                icon: Icons.delete,
                                                backgroundColor:
                                                Colors.pink.shade100,
                                                iconColor: Colors.pink,
                                                onTap: () {}),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          constraints: BoxConstraints(
                              maxWidth: double.infinity,
                              minHeight: Responsive.screenHeight(context) * .07),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == tableValues!.length - 1 ? false : true,
                      child: const Divider(
                        height: 0,
                        thickness: 1,
                      ),
                    ),
                  ],
                );
              })
      ),
    );
    // height: height * 0.97/4,

  }
}*/
