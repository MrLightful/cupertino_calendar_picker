// Copyright (c) 2024 Philip Softworks. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:cupertino_calendar_picker/src/src.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    return DateTime(0, 1, 1, hour, minute);
  }

  DateTime toNowDateTime() {
    return DateTime.now().truncateToMinutes(newHour: hour, newMinute: minute);
  }

  bool isBefore(TimeOfDay other) {
    if (hour < other.hour) {
      return true;
    } else if (hour == other.hour) {
      return minute < other.minute;
    } else {
      return false;
    }
  }

  bool isAfter(TimeOfDay other) {
    if (hour > other.hour) {
      return true;
    } else if (hour == other.hour) {
      return minute > other.minute;
    } else {
      return false;
    }
  }

  String timeWithDayPeriodFormat(BuildContext context) {
    return DateFormat('h:mm').format(toDateTime());
  }

  String timeFormat(
    BuildContext context, {
    required bool? use24hFormat,
  }) {
    final bool use24HoursFormat = use24hFormat ?? context.alwaysUse24hFormat;
    final String pattern = use24HoursFormat ? 'HH:mm' : 'h:mm a';
    return DateFormat(pattern).format(toDateTime());
  }
}
