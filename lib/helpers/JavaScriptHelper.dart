import 'package:flutter_inappwebview/flutter_inappwebview.dart';


// Клас для работы с js
class JavaScriptHelper {
  static void removeAppBarAndBottomBar(InAppWebViewController c) {
    c.evaluateJavascript(source: 'document.getElementById("header").style.display = "none"; document.getElementsByClassName("footer")[0].style.display = "none";');
    // Прячем лишнее
  }
}