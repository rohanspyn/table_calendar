// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../shared/utils.dart' show CalendarFormat;

class FormatButton extends StatelessWidget {
  final CalendarFormat calendarFormat;
  final ValueChanged<CalendarFormat> onTap;

  final EdgeInsets padding;
  final bool showsNextFormat;
  final Map<CalendarFormat, IconData> availableCalendarFormats;

  const FormatButton({
    Key? key,
    required this.calendarFormat,
    required this.onTap,
    required this.padding,
    required this.showsNextFormat,
    required this.availableCalendarFormats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Container(
      child: Icon(_formatButtonContent,
          size: 24, color: Color.fromRGBO(121, 152, 175, 1)),
    );

    final platform = Theme.of(context).platform;

    return !kIsWeb &&
            (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS)
        ? CupertinoButton(
            onPressed: () => onTap(_nextFormat()),
            padding: EdgeInsets.zero,
            child: child,
          )
        : GestureDetector(
            onTap: () => onTap(_nextFormat()),
            child: child,
          );
  }

  IconData get _formatButtonContent => showsNextFormat
      ? availableCalendarFormats[_nextFormat()]!
      : availableCalendarFormats[calendarFormat]!;

  CalendarFormat _nextFormat() {
    final formats = availableCalendarFormats.keys.toList();
    int id = formats.indexOf(calendarFormat);
    id = (id + 1) % formats.length;

    return formats[id];
  }
}
