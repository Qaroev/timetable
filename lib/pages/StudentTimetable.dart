import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:timetable/helpers/JavaScriptHelper.dart';
import 'package:timetable/widgets/LoadingWidget.dart';

class StudentTimetable extends StatefulWidget {
  const StudentTimetable({Key? key}) : super(key: key);

  @override
  _StudentTimetableState createState() => _StudentTimetableState();
}

class _StudentTimetableState extends State<StudentTimetable> {
  bool isLoading = true; // Переменная показывающая состояние загрузки

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          InAppWebView(
            // Загружаем сайт
            initialUrlRequest: URLRequest(
                url: Uri.parse("https://ppkslavyanova.ru/lessonlist")),
            onPageCommitVisible: (InAppWebViewController c, Uri? u) {
              JavaScriptHelper.removeAppBarAndBottomBar(c); // Удаляем лишние элементы сайта
              setState(() {
                Future.delayed(const Duration(milliseconds: 1500), () {
                  setState(() {
                    isLoading = false;
                  });
                });
                // Меняем значение переменной после небольшой задержки
              });
            },
          ),
          isLoading
              ? const LoadingWidget()
              : Stack() // Показываем экран загрузки, пока страница не откроется
        ],
      ),
    );
  }
}
