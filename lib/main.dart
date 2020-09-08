import 'package:clock_ui/provider/theme_provider.dart';
import 'package:clock_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: 'Clock',
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.mode,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
