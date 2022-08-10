import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

// Загрузочный экран
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Ставим задний фон
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Container(
            height: 200,
            alignment: Alignment.center,
            child: LoadingIndicator(
              indicatorType: Indicator.pacman,
              colors: [Colors.blue],
              strokeWidth: 2,
              backgroundColor: Colors.white,
              pathBackgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
