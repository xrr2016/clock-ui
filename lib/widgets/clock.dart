import 'dart:async';
import 'dart:math';

import 'package:clock_ui/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../size_config.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _now = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: kShadowColor.withOpacity(0.14),
                    blurRadius: 64,
                  )
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _now),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Consumer<ThemeProvider>(
            builder: (context, theme, _) {
              return GestureDetector(
                onTap: () => theme.toggleTheme(),
                child: SvgPicture.asset(
                  theme.mode == ThemeMode.light
                      ? "assets/icons/Sun.svg"
                      : "assets/icons/Moon.svg",
                  width: 24,
                  height: 24,
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
