import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobick_shafeeque/responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: Responsive.isDesktop(context)?0:3,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Responsive.screenWidth(context)*.015,),
                Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/lady.PNG'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(
                        Responsive.screenHeight(context) * .1 / 4,
                      )),
                  height: !Responsive.isDesktop(context)?Responsive.screenHeight(context)*.05:Responsive.screenHeight(context)*.07,
                  width: !Responsive.isDesktop(context)?Responsive.screenHeight(context)*.05:Responsive.screenHeight(context)*.07,
                ),
                SizedBox(width: Responsive.screenWidth(context)*.01,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Franklin Jr',style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,),),
                    Text('Super admin ',style: Theme.of(context).textTheme.caption,),
                  ],
                )
              ],
            ),
          ),

          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Jobs",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Apps",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Charts",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Bootstrap",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Plugin",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,top: 4),
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          color: Colors.grey,
          height: 16,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
