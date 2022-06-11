import 'package:flutter/material.dart';

class Utils {


  static Future<DateTime?> getDateFromDatePicker(BuildContext context,
      {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
    DateTime currentDate = DateTime.now();
    initialDate = initialDate ?? currentDate;
    firstDate = firstDate ?? DateTime(1900);
    lastDate = lastDate ?? currentDate;
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    return picked;
  }
}

