import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../helpers/JavaScriptHelper.dart';
import '../widgets/LoadingWidget.dart';

class WebSitePage extends StatefulWidget {
  const WebSitePage({Key? key}) : super(key: key);

  @override
  State<WebSitePage> createState() => _WebSitePageState();
}

class _WebSitePageState extends State<WebSitePage> {
  bool isLoading = true; // Переменная показывающая состояние загрузки

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          InAppWebView(
            // Загружаем сайт
            initialUrlRequest: URLRequest(url: Uri.parse("https://taplink.cc/ppkraspisanie")),
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
