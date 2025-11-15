import 'package:hdouri/config/constants/localization_constants.dart';

import 'package:hdouri/exports.dart';
String getTimeString(int? time) {
  if (time.isNotNull) {
    // Calculate the number of hours.
    int hours = time! ~/ 3600;

    // Calculate the remaining minutes.
    int minutes = ((time % 3600) / 60).roundToDouble().toInt();

    // Calculate the remaining seconds.
    int seconds = time % 60;

    // If the time is greater than or equal to 1 hour, return a string representing the time in hours.
    if (hours >= 1) {
      return "$hours ${AppStrings.hours.trans}";
    }

    // If the time is greater than or equal to 1 minute, return a string representing the time in minutes.
    else if (minutes >= 1) {
      return "$minutes ِ${AppStrings.minutes.trans}";
    }

    // Otherwise, return a string representing the time in seconds.
    else {
      return "$seconds ${AppStrings.seconds.trans}";
    }
  } else {
    return AppConstants.empty;
  }
}

String getTime(String dateTime) {
  String dateTimeString = "2024-12-14T15:00:03.000000Z";

  // Parse the string into a DateTime object
  DateTime convertedDateTime = DateTime.parse(dateTime);

  // Format the DateTime object to extract the time
  String extractedTime = DateFormat('HH:mm').format(convertedDateTime);

  print("Extracted time: $extractedTime"); // Output: 15:00:03
  return extractedTime;
}

String sinceDate(String dateTimeString) {
  print("datatime" + dateTimeString);

  final dateTime = DateTime.parse(dateTimeString.substring(0, 19));
  print("datatime" + dateTime.toString());

  final now = DateTime.now();

  print("now" + now.toString());

  final difference = dateTime.difference(now).abs();
  print("the differenc is ${difference}");
  final differenceInDays = difference.inDays;
  final differenceInHours = difference.inHours.remainder(24); // Hours within the day
  final differenceInMinutes = difference.inMinutes.remainder(60); // Minutes within the hour
  final differenceInSeconds = difference.inSeconds.remainder(60); // Seconds within the minute

  String formattedTime;
  if (differenceInHours == 0 && differenceInMinutes == 0 && differenceInSeconds >= 0) {
    formattedTime = AppStrings.now.trans;
  } else if (differenceInHours == 0 && differenceInMinutes > 0) {
    if (differenceInMinutes <= 10)
      formattedTime = '${AppStrings.since.trans} $differenceInMinutes ${AppStrings.minutes.trans}';
    else {
      formattedTime = '${AppStrings.since.trans} $differenceInMinutes ${AppStrings.minutesSingle.trans}';
    }
  } else if (differenceInHours <= 12) {
    if (differenceInHours == 1) {
      formattedTime = '${AppStrings.since.trans} ${AppStrings.hoursSingle.trans}';
    } else if (differenceInHours == 2) {
      formattedTime = '${AppStrings.since.trans} ${AppStrings.hoursTwo.trans}';
    } else if (differenceInHours > 2 && differenceInHours <= 10) {
      formattedTime = '${AppStrings.since.trans} $differenceInHours ${AppStrings.hours.trans}';
    } else {
      formattedTime = '${AppStrings.since.trans} $differenceInHours ${AppStrings.hoursSingle.trans}';
    }
  } else if (differenceInDays == 1) {
    formattedTime = AppStrings.yesterday.trans;
  } else {
    try {
      DateTime dateTime = DateTime.parse(dateTimeString);
      DateFormat formatter = DateFormat('dd-MM-yyyy', 'ar');
      formattedTime = formatter.format(dateTime);
    } catch (e) {
      print('Error parsing date: $e');
      return 'Invalid Date'; // Return a default value or handle the error appropriately
    }
    ;
  }

  return formattedTime;
}

String getTimeInAmPm(String timeString) {
  try {
    DateTime dateTime = DateTime.parse(timeString);
    String formattedTime = DateFormat.jm(AppLocalizationsConstants().arLocale.toString()).format(dateTime);
    return formattedTime;
  } catch (e) {
    print("Error parsing time: $e");
    return "Invalid Time";
  }
}

// Function to extract the date from the createdAt string
String getDateFromCreatedAt(String createdAt) {
  DateTime dateTime = DateTime.parse(createdAt);
  return DateFormat('yyyy-MM-dd').format(dateTime);
}
