import 'package:flutter/material.dart';


// Добавим класс для удобного использования BottomNavigationBar
class BottomNavBarHelper {
  // Так же создадим данные которые он принимает
  final IconData iconA;
  final IconData iconB;
  final String label;
  final Widget body;
  final bool showAds;

  // Добавим их в конструктор
  BottomNavBarHelper({this.showAds = true, required this.iconA, required this.label, required this.body, required this.iconB});
}
