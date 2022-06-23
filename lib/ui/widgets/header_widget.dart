import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/core/res/constants.dart';
import 'package:jobick_shafeeque/core/res/responsive.dart';
import 'package:jobick_shafeeque/ui/widgets/custom_icon_button_widget.dart';


class Header extends StatelessWidget {
   VoidCallback? onTapAddJob;
   Header({
    Key? key,required this.onTapAddJob
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
          const SizedBox(
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
            if (Responsive.isDesktop(context)) const Spacer(),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultPadding),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                  backgroundColor: Colors.red),
              onPressed: onTapAddJob,
              icon: const Icon(Icons.add),
              label: const Text("Add New Job"),
            ),
            if (!Responsive.isDesktop(context)) const Spacer(),
            const SizedBox(
              width: 10,
            ),
            CustomIconButtonWidget(
              icon: Icons.mail,
              backgroundColor: Colors.teal,
              iconColor: Colors.white,
              boarderRadius: 19,
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            CustomIconButtonWidget(
              icon: Icons.phone,
              backgroundColor: Colors.teal,
              iconColor: Colors.white,
              boarderRadius: 19,
              onTap: () {},
            ),
            const SizedBox(
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
