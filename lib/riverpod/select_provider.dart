import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    state = ShoppingItemModel(
        name: state.name,
        quantity: state.quantity,
        hasBought: !state.hasBought,
        isSpicy: state.isSpicy);
  }

  toggleIsSpicy() {
    // text에서 특정 속성만 변경해서 복사하는 방법
    final ts = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
    final ts2 = ts.copyWith(
      fontSize: 30,
    );
    // 위에 copy with방식을 직접 구현한다.
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
