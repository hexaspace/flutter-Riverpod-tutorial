import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/layout/default_layout.dart';
import 'package:flutter_riverpod_tutorial/riverpod/future_provider.dart';

class FutureProvidorScreen extends ConsumerWidget {
  const FutureProvidorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleFutureProvider); // 캐싱이 된다.
    // state는 AsyncValue 타입이다. 무조건 when함수가 있다.

    return DefaultLayout(
        title: 'FutureProvidor',
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              state.when(
                // map : 프리즈드 할때 나중에 써봄. map과 when있다.
                data: (data) {
                  return Text(
                    data.toString(),
                    textAlign: TextAlign.center,
                  );
                },

                /// 로딩끝나고 데이터 있을때 실행 함수
                error: (err, stack) => Text(
                  err.toString(),
                ), // 에러났을때 함수
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ), // 로딩중 함수
              ),
            ]));
  }
}
