import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

enum TabItem {
  main(
    'Главная',
    Icon(AdmiralIcons.admiral_ic_star_solid),
  ),
  info(
    'Инфо',
    Icon(AdmiralIcons.admiral_ic_mobile_solid),
  ),
  chat(
    'Чат',
    Icon(AdmiralIcons.admiral_ic_chat_solid),
  ),
  settings(
    'Настройки',
    Icon(AdmiralIcons.admiral_ic_settings_solid),
  );

  const TabItem(
    this.title,
    this.icon,
  );

  final String title;
  final Icon icon;
}
