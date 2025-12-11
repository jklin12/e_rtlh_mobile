//import 'dart:ui';

import 'package:intl/intl.dart';

//const LOCALE_INDONESIA = Locale('id', 'ID');

final DateFormat indonesianDateTimeFormat = DateFormat('dd MMMM yyyy');
final DateFormat indonesianShortDateTimeFormat = DateFormat('dd MMM yyyy');
final DateFormat sqlDateFormat = DateFormat('yyyy-MM-dd');
final DateFormat defaultDateTimeFormat = DateFormat('yyyy-MM-dd');
final DateFormat defaultIndonesianDateTimeFormat = DateFormat('dd-MM-yyyy');
final DateFormat readableIndonesianDateTimeFormat = DateFormat('dd/MM/yyyy');

final DateTime firstDate = DateTime(
  DateTime.now().year - 100,
);

final DateFormat fullIndonesianDateTimeFormat =
    DateFormat('dd MMMM yyyy • HH:mm');

String convertToIndonesianFormat(String? date) {
  if (date != null) {
    try {
      DateTime dateTime = defaultDateTimeFormat.parse(date);
      return indonesianDateTimeFormat.format(dateTime);
    } catch (e) {
      return '';
    }
  } else {
    return '';
  }
}

String convertDefaultToIndonesianFormat(String? date) {
  if (date != null) {
    try {
      DateTime dateTime = defaultIndonesianDateTimeFormat.parse(date);
      return indonesianDateTimeFormat.format(dateTime);
    } catch (e) {
      return '';
    }
  } else {
    return '';
  }
}

String getTomorrowDateTime() {
  try {
    DateTime dateTime = DateTime.now().add(const Duration(days: 1));
    return fullIndonesianDateTimeFormat.format(dateTime);
  } catch (e) {
    return '';
  }
}

String convertToFullIndonesianDateTimeFormatFromEpoch(int? epoch) {
  if (epoch != null) {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
      return fullIndonesianDateTimeFormat.format(dateTime);
    } catch (e) {
      return getTomorrowDateTime();
    }
  } else {
    return '';
  }
}

String convertToIndonesianFormatFromEpoch(int? epoch) {
  if (epoch != null && epoch != 0) {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
      return indonesianDateTimeFormat.format(dateTime);
    } catch (e) {
      return '';
    }
  } else {
    return '';
  }
}

DateTime convertToDateTime(String date) {
  if (date.isNotEmpty) {
    return indonesianDateTimeFormat.parse(date);
  } else {
    return DateTime.now();
  }
}

DateTime convertToDateTimeUTC(String date) {
  if (date.isNotEmpty) {
    return indonesianDateTimeFormat.parse(date, true);
  } else {
    return DateTime.now();
  }
}

DateTime? convertToDateNullable(String date) {
  if (date.isNotEmpty) {
    return indonesianDateTimeFormat.parse(date);
  } else {
    return null;
  }
}

DateTime? convertIndonesianDateToDateNullable(String date) {
  if (date.isNotEmpty) {
    return defaultDateTimeFormat.parse(date);
  } else {
    return null;
  }
}

DateTime convertIndonesianDateToDateTime(String date) {
  if (date.isNotEmpty) {
    return defaultDateTimeFormat.parse(date);
  } else {
    return DateTime.now();
  }
}

DateTime convertReadableIndonesianDateToDateTime(String date) {
  if (date.isNotEmpty) {
    return readableIndonesianDateTimeFormat.parse(date);
  } else {
    return DateTime.now();
  }
}

String convertReadableDateIntoDefaultDateTime(String date) {
  if (date.isNotEmpty) {
    try {
      DateTime dateTime = readableIndonesianDateTimeFormat.parse(date);
      return defaultDateTimeFormat.format(dateTime);
    } catch (e) {
      return '';
    }
  } else {
    return '';
  }
}

DateTime? convertReadableIndonesianDateToDateNullable(String date) {
  if (date.isNotEmpty) {
    return readableIndonesianDateTimeFormat.parse(date);
  } else {
    return null;
  }
}

String formatIndonesianDateTime(String? date) {
  if (date != null) {
    var dateTime = defaultDateTimeFormat.parse(date);
    return indonesianShortDateTimeFormat.format(dateTime);
  } else {
    return '';
  }
}

String convertToIndonesianFormatFromDateTime(DateTime date) {
  //try {
  return indonesianDateTimeFormat.format(date);
  //} catch (e) {
  //return '';
  //}
}

String convertToIndonesianShortFormatFromDateTime(DateTime? date) {
  try {
    if (date == null) return '';
    return indonesianShortDateTimeFormat.format(date);
  } catch (e) {
    return '';
  }
}

String convertSqlDateFormat(DateTime? date) {
  try {
    return "${date!.year}-${date.month}-${date.day}";
  } catch (e) {
    return '';
  }
}

int convertToTimeEpoch(String date) {
  return indonesianDateTimeFormat.parse(date).millisecondsSinceEpoch ~/ 1000;
}

DateTime convertToDateTimeFromEpoch(int? epoch) {
  if (epoch != null) return DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  return DateTime.now();
}

String convertEpochToStringDate(int epoch, DateFormat format) {
  return format.format(convertToDateTimeFromEpoch(epoch));
}

String convertDefaultDateTimeToReadableDateTime(String date) {
  if (date.isNotEmpty) {
    try {
      DateTime dateTime = defaultDateTimeFormat.parse(date);
      return readableIndonesianDateTimeFormat.format(dateTime);
    } catch (e) {
      return '';
    }
  } else {
    return '';
  }
}

String formatTimeSisca(String? time) {
  try {
    // Pastikan panjang input adalah 6 karakter
    if (time!.length != 6) return "Format tidak valid";

    // Pisahkan menjadi jam, menit, dan detik
    String hour = time.substring(0, 2);
    String minute = time.substring(2, 4);
    //String second = time.substring(4, 6);

    // Gabungkan dengan format "hh:mm:ss"
    return "$hour:$minute";
  } catch (e) {
    return '';
  }

  
}
