import 'package:flutter/material.dart';

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