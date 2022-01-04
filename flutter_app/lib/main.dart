import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/parsing_json/json_parsing.dart';
import 'package:flutterapp/parsing_json/json_parsing_map.dart';

import 'ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.red,
      backgroundColor: Colors.amber,
      textTheme: _appTextTheme(base.textTheme));
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline6: base.headline6.copyWith(fontWeight: FontWeight.w500),
          subtitle1: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          button: base.button.copyWith(
//          fontSize: 23.9,

              ),
          bodyText1: base.bodyText1.copyWith(
              fontSize: 16.9, color: Colors.white, fontFamily: "Lobster"))
      .apply(fontFamily: "Lobster", displayColor: Colors.amber);
}

//void main() => runApp(ScaffoldExample());
void main() => runApp(new MaterialApp(
//      theme: _appTheme,
      home: MovieListView(),
    ));
