import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/layout/default_layout.dart';
import 'package:flutter_riverpod_tutorial/riverpod/provider.dart';
import 'package:flutter_riverpod_tutorial/riverpod/state_notifier_provider.dart';

class ProvidorScreen extends ConsumerWidget {
  const ProvidorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    print(state);
    return DefaultLayout(
        title: 'ProvidorScreen',
        actions: [
          PopupMenuButton<FilterState>(
              itemBuilder: (_) => FilterState.values
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                // 팝업메뉴중 선택했을때
                ref.read(filterProvider.notifier).update((state) => value);
              })
        ],
        body: ListView(
          children: state
              .map(
                (e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) {
                    ref.read(shoppingListProvider.notifier).toggleHasBought(
                          name: e.name,
                        );
                  },
                ),
              )
              .toList(),
        ));
  }
}
