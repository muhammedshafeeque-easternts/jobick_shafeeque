import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/controllers/drawer_controller.dart';
import 'package:jobick_shafeeque/responsive.dart';
import 'package:jobick_shafeeque/screens/dashboard/components/table_data.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class AppBarWidget extends StatelessWidget {
  final bool? showDrawer;
  const AppBarWidget({Key? key, this.showDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthBetween = !Responsive.isDesktop(context) ? 20.0 : 30.0;
    return Row(
      children: [
        if (Responsive.isDesktop(context))
          Image.asset("assets/images/jobick_logo.PNG",
              height: MediaQuery.of(context).size.height * .07),
        if (Responsive.isDesktop(context))
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Jobick',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Job Admin Dashboard',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        if (!Responsive.isDesktop(context))
          SizedBox(
              width: Responsive.screenWidth(context) * .1,
              height: Responsive.screenWidth(context) * .1,
              child: Image.asset(
                "assets/images/jobick_logo.PNG",
              )),
        // if (!Responsive.isDesktop(context))
        SizedBox(
          width: Responsive.screenWidth(context) * .055,
        ),
        if (!Responsive.isDesktop(context))
        Visibility(
          visible: showDrawer != null && showDrawer != false,
          child: IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        ),
        SizedBox(
          width: defaultPadding,
        ),
        if (Responsive.isDesktop(context))
          Text(
            'Job List',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        if (!Responsive.isMobile(context))
          SizedBox(
            width: Responsive.screenWidth(context) * .08,
          ),
        // if (!Responsive.isMobile(context))
        //   Spacer(),
        if (!Responsive.isMobile(context)) Expanded(child: SearchField()),
        if (!Responsive.isMobile(context))
          SizedBox(
            width: defaultPadding,
          ),
        if (!Responsive.isMobile(context))
          CustomIconButtonWidget(
              icon: Icons.add,
              backgroundColor: headerButtonColors,
              iconColor: Colors.white,
              onTap: () {},
              horizontalPadding: 11,
              verticalPadding: 11),
        Spacer(),
        Icon(Icons.chat),
        SizedBox(
          width: widthBetween,
        ),
        Icon(Icons.notifications),
        SizedBox(width: widthBetween),
        Icon(Icons.settings),
        SizedBox(width: widthBetween),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/lady.PNG'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(
                Responsive.screenHeight(context) * .1 / 3,
              )),
          height: !Responsive.isDesktop(context)
              ? Responsive.screenHeight(context) * .05
              : Responsive.screenHeight(context) * .08,
          width: !Responsive.isDesktop(context)
              ? Responsive.screenHeight(context) * .05
              : Responsive.screenHeight(context) * .08,
        ),
        SizedBox(
          width: Responsive.screenWidth(context) * .014,
        )
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        contentPadding: EdgeInsets.symmetric(
            horizontal: !Responsive.isDesktop(context)
                ? Responsive.screenWidth(context) * .03
                : Responsive.screenWidth(context) * .01,
            vertical: Responsive.screenHeight(context) * .001),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        suffixIcon: Container(
          padding: EdgeInsets.all(0),
          // margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
