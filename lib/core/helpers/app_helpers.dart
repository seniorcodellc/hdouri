import 'package:flutter/cupertino.dart';

import '../../exports.dart';

String getSlashedTime(DateTime dateTime) => DateFormat('d / M / yyyy').format(dateTime);
String getDashedTime(DateTime dateTime) => DateFormat('yyyy-M-d').format(dateTime);
Future<DateTime?> showCalender({
  required DateTime initialDateTime,
  required DateTime minimumDate,
  required DateTime maximumDate,
}) async {
  DateTime? selectedDate;
  await showCustomDialog<String>(
    insetPadding: EdgeInsets.all(0),
    child: SizedBox(
      height: 200.h,
      width: width,
      child: Column(
        children: [
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initialDateTime,
              minimumDate: minimumDate,

              maximumDate: maximumDate,

              onDateTimeChanged: (DateTime newDate) {
                //pop(DateFormat('d / M / yyyy').format(newDate));
                selectedDate = newDate;
              },
            ),
          ),
          TextButton(
            child: Text(AppStrings.dateSelected.trans, style: getMediumTextStyle(fontSize: 20)),
            onPressed: () {
              pop();
            },
          ),
        ],
      ),
    ),
  );
  return selectedDate;
}
String weekdayArabic(int weekday) {
  // 1=Mon ... 7=Sun
  switch (weekday) {
    case DateTime.monday:
      return 'الاثنين';
    case DateTime.tuesday:
      return 'الثلاثاء';
    case DateTime.wednesday:
      return 'الأربعاء';
    case DateTime.thursday:
      return 'الخميس';
    case DateTime.friday:
      return 'الجمعة';
    case DateTime.saturday:
      return 'السبت';
    case DateTime.sunday:
      return 'الأحد';
  }
  return '';
}