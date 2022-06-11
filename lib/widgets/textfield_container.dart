import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  const TextFieldContainer({
    Key? key,
   required this.child,this.leftPadding=0.0,this.rightPadding=0.0,
    this.topPadding=0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding:  EdgeInsets.only(
              left: leftPadding, right:rightPadding,top: topPadding
            // left: width*.03, right:width*.03,top: hieght*.015

          ),
      child: child,
    );
  }
}