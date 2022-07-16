import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_yandex_ads/widgets/banner.dart';
import 'package:flutter_yandex_ads/widgets/native.dart';
import 'package:flutter_yandex_ads/yandex.dart';
import 'package:timetable/helpers/BottomNavBarHelper.dart';
import 'package:timetable/pages/BellsTimetable.dart';
import 'package:timetable/pages/StudentTimetable.dart';
import 'package:timetable/pages/TeachersTimetable.dart';
import 'package:timetable/widgets/CustomIcon.dart';

import 'WebSitePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlutterYandexAds ads;

  @override
  void initState() {
    super.initState();
    ads = FlutterYandexAds();
    ads.initialize();
  }

  int _selectedNow = 0; // Пременная для отслеживания страницы
  List<BottomNavBarHelper> pages = [
    BottomNavBarHelper(
      iconA: Icons.person,
      iconB: Icons.person_outline,
      label: "Ученики",
      body: const StudentTimetable(),
    ),
    BottomNavBarHelper(
      iconA: Icons.people,
      iconB: Icons.people_outline,
      label: "Учителя",
      body: const TeachersTimetable(),
    ),
    BottomNavBarHelper(
      iconA: Icons.access_time_filled,
      iconB: Icons.schedule,
      label: "Звонки",
      body: const BellsTimetable(),
    ),
    BottomNavBarHelper(
        showAds: false,
        iconA: Icons.info,
        iconB: Icons.info_outline,
        label: "Информация",
        body: const WebSitePage()),
  ]; // Задаём список страниц

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        // Тип BottomNavigationBar
        snakeShape: SnakeShape.circle,
        // Форму обводки активной иконки
        // Зададим отступы
        snakeViewColor: Colors.white,
        // Установим цвет обводки активной иконки
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        // Зададим цвет фона
        unselectedItemColor: Colors.black,
        // Установим цвета иконок
        selectedItemColor: Colors.black,
        // Установим цвета иконок
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
        ),
        // Укажем форму BottomNavigationBar
        currentIndex: _selectedNow,
        // Установим позицию выбранной иконки
        onTap: (index) => setState(() => _selectedNow = index),
        // Установим callback при нажатии
        items: List.generate(
          pages.length,
          (index) => BottomNavigationBarItem(
            icon: _selectedNow == index
                ? Icon( // Логика заполнения иконок (пустая или заполненная)
                    pages[index].iconA, // Логика заполнения иконок (пустая или заполненная)
                    size: 40, // Логика заполнения иконок (пустая или заполненная)
                  ) // Логика заполнения иконок (пустая или заполненная)
                : Icon( // Логика заполнения иконок (пустая или заполненная)
                    pages[index].iconB, // Логика заполнения иконок (пустая или заполненная)
                    size: 40, // Логика заполнения иконок (пустая или заполненная)
                  ),  // Логика заполнения иконок (пустая или заполненная)
            label: pages[index].label,
          ),
        ),
        // Создадим список иконок
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.black),
                ),
              ), // цвет обводки и обводка
              child: Visibility(
                visible: pages[_selectedNow].showAds,
                // показываем рекламу если можно
                child: SizedBox(
                  height: 50, // высота по высоте баннера ниже
                  child: YandexAdsBannerWidget(
                    ads: ads,
                    id: 'R-M-1679655-1', // R-M-1679654-1 замените ключ после выхода в play market
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.white, // устанавливаем цвет сайта
                child: pages[_selectedNow].body, // устанавливаем страницу
              ),
            ),
          ],
        ),
      ),
      // Отображаем выбранный элемент
    );
  }
}
