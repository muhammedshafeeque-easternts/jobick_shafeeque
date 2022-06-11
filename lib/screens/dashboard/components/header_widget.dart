import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/constants.dart';
import 'package:jobick_shafeeque/responsive.dart';
import 'package:jobick_shafeeque/screens/add_new_job_screen/add_new_job_screen.dart';
import 'package:jobick_shafeeque/screens/dashboard/components/table_data.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isDesktop(context))
          Text(
            "Job List",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        if (!Responsive.isDesktop(context))
          SizedBox(
            height: defaultPadding / 2,
          ),
        Row(
          children: [
            if (Responsive.isDesktop(context))
              Text(
                "Job List",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            if (Responsive.isDesktop(context)) Spacer(),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(defaultPadding),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                  backgroundColor: Colors.red),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return Responsive.isDesktop(context)
                          ? AlertDialog(
                              // contentPadding: EdgeInsets.all(10.0),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              content: SizedBox(
                                width: Responsive.screenWidth(context) * .7,
                                height: Responsive.screenHeight(context) * .7,
                                child: AddNewJobScreen(),
                              )
                              // AddNewJobScreen()
                              )
                          : AddNewJobScreen();
                    });
                // Navigator.pushNamed(context, AppRoutes.addNewJobScreen);
              },
              icon: Icon(Icons.add),
              label: Text("Add New Job"),
            ),
            if (!Responsive.isDesktop(context)) Spacer(),
            SizedBox(
              width: 10,
            ),
            CustomIconButtonWidget(
              icon: Icons.mail,
              backgroundColor: Colors.teal,
              iconColor: Colors.white,
              boarderRadius: 19,
              onTap: () {},
            ),
            SizedBox(
              width: 10,
            ),
            CustomIconButtonWidget(
              icon: Icons.phone,
              backgroundColor: Colors.teal,
              iconColor: Colors.white,
              boarderRadius: 19,
              onTap: () {},
            ),
            SizedBox(
              width: 10,
            ),
            CustomIconButtonWidget(
              icon: Icons.height,
              backgroundColor: Colors.red,
              iconColor: Colors.white,
              boarderRadius: 19,
              horizontalPadding: 6,
              onTap: () {},
            ),
            SizedBox(
              width: Responsive.screenWidth(context) * .014,
            )
          ],
        ),
      ],
    );
  }
}
