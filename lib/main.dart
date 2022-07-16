import 'package:flutter/material.dart';
import 'package:flutter_yandex_ads/yandex.dart';
import 'package:timetable/pages/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Расписание', // Устанавливаем заголовок
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
      ), // Настраиваем тему приложения
      home: const MainPage(), // Выбираем главную страницу
    );
  }
}
