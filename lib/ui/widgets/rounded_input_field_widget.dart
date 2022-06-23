import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/core/res/constants.dart';
import 'package:jobick_shafeeque/core/res/responsive.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool? readOnly;
  final double? rightPadding;
  final double? leftPadding;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon,
      this.onChanged,
      this.leftPadding,
      this.rightPadding,
      this.controller,
      this.onTap,
      this.readOnly,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      validator: validator,
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryLightColor,
        contentPadding: EdgeInsets.symmetric(
            horizontal: !Responsive.isDesktop(context)
                ? Responsive.screenWidth(context) * .03
                : Responsive.screenWidth(context) * .01,
            vertical: Responsive.screenHeight(context) * .001),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Icon(
                    icon,
                    color: kPrimaryColor,
                  ),
                ),
              )
            : null,
        hintText: hintText,
        // hintStyle: const TextStyle(fontFamily: 'Gilroy'),
        // border: InputBorder.none,
      ),
    );
  }
}
