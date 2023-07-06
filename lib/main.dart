import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/riverpod/provider_observer.dart';
import 'package:flutter_riverpod_tutorial/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(), // ProviderScope에 있는 모든 providor가 업데이트 된다면, 안의 함수를 부른다
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
