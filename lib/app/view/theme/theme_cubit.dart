import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_hour/app/view/theme/light_theme.dart';
import 'package:office_hour/app/view/theme/theme.dart';

extension ThemeExtension on BuildContext {
  AppColors get colors => read<ThemeCubit>().state.colors;
  TextTheme get textTheme => Theme.of(this).textTheme;

  void changeTheme(AppTheme appTheme) =>
      read<ThemeCubit>().changeTheme(appTheme);
}

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(LightTheme());

  void changeTheme(AppTheme appTheme) {
    emit(appTheme);
  }
}
