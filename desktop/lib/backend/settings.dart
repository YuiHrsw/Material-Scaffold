//dart run build_runner build

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'settings.g.dart';

@JsonSerializable()
class AppSettings {
  ThemeMode themeMode;
  int themeCode;

  AppSettings({
    this.themeMode = ThemeMode.system,
    this.themeCode = 0,
  });

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}
