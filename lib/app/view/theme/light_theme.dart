import 'package:flutter/material.dart';
import 'package:office_hour/app/view/theme/theme.dart';

class LightTheme extends AppTheme {
  @override
  AppColors get colors => LightColors();

  @override
  FilledButtonTheme get filledButtonTheme => throw UnimplementedError();

  @override
  OutlinedButtonTheme get outlinedButtonTheme => throw UnimplementedError();

  @override
  TextTheme get textTheme => TextTheme();

  @override
  ThemeData get theme => ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.background,
      foregroundColor: colors.surface900,
      //TODO: Refactor it later
      titleTextStyle: TextStyle(
        color: colors.surface900,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class LightColors extends AppColors {
  @override
  Color get background => Colors.white;

  @override
  Color get primary => const Color(0xff12bf52);

  @override
  Color get primary2nd => const Color(0xff22c55e);

  @override
  Color get primary3rd => const Color(0xff4ade80);

  @override
  Color get primary4th => const Color(0xff86efac);

  @override
  Color get primary5th => const Color(0xffbbf7d0);

  @override
  Color get primary6th => const Color(0xffdcfce7);

  @override
  Color get secondary => const Color(0xff03314b);

  @override
  Color get secondary2nd => const Color(0xff03314b);

  @override
  Color get secondary3rd => const Color(0xff22688f);

  @override
  Color get secondary4th => const Color(0xff5ca8d3);

  @override
  Color get secondary5th => const Color(0xffbde7ff);

  @override
  Color get secondary6th => const Color(0xfff5fbff);

  @override
  Color get surface50 => const Color(0xfff8fafc);

  @override
  Color get surface100 => const Color(0xfff1f5f9);

  @override
  Color get surface200 => const Color(0xffe2e8f0);

  @override
  Color get surface300 => const Color(0xffcbd5e1);

  @override
  Color get surface400 => const Color(0xff94a3b8);

  @override
  Color get surface500 => const Color(0xff64748b);

  @override
  Color get surface600 => const Color(0xff475569);

  @override
  Color get surface700 => const Color(0xff334155);

  @override
  Color get surface800 => const Color(0xff1e293b);

  @override
  Color get surface900 => const Color(0xff121826);

  @override
  Color get success => const Color(0xff22c55e);

  @override
  Color get warning => const Color(0xfffacc15);

  @override
  Color get error => const Color(0xfff75555);
}
