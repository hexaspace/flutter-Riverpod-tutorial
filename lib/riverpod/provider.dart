import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.notSpicy) {
      return shoppingListState.where((element) => !element.isSpicy).toList();
    } else if (filterState == FilterState.isSpicy) {
      return shoppingListState.where((element) => element.isSpicy).toList();
    } else if (filterState == FilterState.all) {
      return shoppingListState;
    }
  },
);

enum FilterState {
  // 안매움
  notSpicy,
  isSpicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
