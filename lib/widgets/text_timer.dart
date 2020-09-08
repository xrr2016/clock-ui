import 'dart:async';

import 'package:flutter/material.dart';

import '../size_config.dart';

class TextTimer extends StatefulWidget {
  @override
  _TextTimerState createState() => _TextTimerState();
}

class _TextTimerState extends State<TextTimer> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        _timeOfDay = TimeOfDay.now();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 5),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            "$period",
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        ),
      ],
    );
  }
}
