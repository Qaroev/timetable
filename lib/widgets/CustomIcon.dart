import 'package:flutter/material.dart';


// Создаём класс иконок-изображений для удобства
class CustomIcon extends StatelessWidget {
  final String icon;

  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Image.asset("assets/$icon.png"), // Ставим иконку
      radius: 20, // Размер иконки равен диаметру
      backgroundColor: Colors.transparent, // Ставим цвет на прозрачный
    );
  }
}
