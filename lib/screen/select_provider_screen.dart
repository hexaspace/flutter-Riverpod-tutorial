import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/layout/default_layout.dart';
import 'package:flutter_riverpod_tutorial/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(selectProvider);
    // is state만 바라보기때문에 bool 타입이됩니다.
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // listen은 build를 다시 실행시키 않는다.ㅇ
    ref.listen(
      selectProvider.select((value) => value.hasBought),
      (previous, next) {
        print("next  : $next");
      },
    );
    return DefaultLayout(
        title: 'SelectProviderScreen',
        body: SizedBox(
          width: double.infinity, // 가운데정렬
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(state.name),
              // Text(state.quantity.toString()),
              // Text(state.hasBought.toString()),
              Text(state.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleHasBought();
                  },
                  child: Text('toggleHasBought')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleIsSpicy();
                  },
                  child: Text('toggleIsSpicy')),
            ],
          ),
        ));
  }
}
