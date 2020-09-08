import 'package:clock_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import './text_timer.dart';
import './clock.dart';
import 'city_card.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextTimer(),
            Spacer(),
            Clock(),
            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CityCard(
                    country: "New York, USA",
                    timeZone: "+3 HRS | EST",
                    icon: "assets/icons/Liberty.svg",
                    time: "9:20",
                    period: "AM",
                  ),
                  CityCard(
                    country: "Sydney, AU",
                    timeZone: "+19 HRS | AEST",
                    icon: "assets/icons/Sydney.svg",
                    time: "1:20",
                    period: "AM",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
