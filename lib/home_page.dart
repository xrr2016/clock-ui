import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import './widgets/add_button.dart';
import './widgets/home_body.dart';
import './size_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/Settings.svg",
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
        ),
        actions: [
          AddButton(),
        ],
      ),
      body: HomeBody(),
    );
  }
}
