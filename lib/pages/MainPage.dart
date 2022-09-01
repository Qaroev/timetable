import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_yandex_ads/widgets/banner.dart';
import 'package:flutter_yandex_ads/yandex.dart';
import 'package:timetable/helpers/BottomNavBarHelper.dart';
import 'package:timetable/pages/BellsTimetable.dart';
import 'package:timetable/pages/StudentTimetable.dart';
import 'package:timetable/pages/TeachersTimetable.dart';

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
  List<dynamic> pages = [
    const StudentTimetable(),
    const BellsTimetable(),
    const TeachersTimetable(),
    const WebSitePage()
  ]; // Задаём список страниц

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        currentIndex: _selectedNow,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ads = FlutterYandexAds();
          ads.initialize();
         setState(() => _selectedNow = index);
        },
        iconSize: 18,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon:  Icon(Icons.assignment,size: 24,),
            icon: Icon(Icons.assignment,size: 24,color: Colors.grey,),
            label: 'ٍУроки',
          ),
          BottomNavigationBarItem(
            activeIcon:  Icon(Icons.pages,size: 24,),
            icon:  Icon(Icons.pages,size: 24,color: Colors.grey,),
            label: 'Лента',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.chat_bubble,size: 24,),
            icon:  Icon(Icons.chat_bubble,size: 24,color: Colors.grey,),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.widgets,size: 24,),
            icon:  Icon(Icons.widgets,size: 24,color: Colors.grey,),
            label: 'ٰМеню',
          ),
        ],
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
                visible: true,
                // показываем рекламу если можно
                child: SizedBox(
                  height: 50, // высота по высоте баннера ниже
                  child: YandexAdsBannerWidget(
                    ads: ads,
                    id: 'R-M-1679655-${_selectedNow == 0 ? 1 : 4}', // R-M-1679654-1 замените ключ после выхода в play market
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white, // устанавливаем цвет сайта
                child: pages[_selectedNow], // устанавливаем страницу
              ),
            ),
          ],
        ),
      ),
      // Отображаем выбранный элемент
    );
  }
}
