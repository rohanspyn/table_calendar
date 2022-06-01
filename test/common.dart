// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/src/shared/utils.dart';

ValueKey<String> dateToKey(DateTime date, {String prefix = ''}) {
  return ValueKey('$prefix${date.year}-${date.month}-${date.day}');
}

const calendarFormatMap = const {
  CalendarFormat.month: Icons.keyboard_arrow_down_rounded,
  CalendarFormat.week: Icons.keyboard_arrow_up_rounded,
};
