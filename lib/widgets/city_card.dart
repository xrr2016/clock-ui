import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class CityCard extends StatelessWidget {
  final String country;
  final String timeZone;
  final String icon;
  final String time;
  final String period;

  const CityCard({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.icon,
    @required this.time,
    @required this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                ),
                SizedBox(height: 5),
                Text(timeZone),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      width: getProportionateScreenWidth(40),
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                    Spacer(),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(period),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
