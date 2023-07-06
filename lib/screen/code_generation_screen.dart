import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/layout/default_layout.dart';
import 'package:flutter_riverpod_tutorial/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    return DefaultLayout(
        title: "CodeGenerationScreen",
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(state1),
            state2.when(
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
            state3.when(
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
            Text(state4.toString()),
            // state5가 변경되었을때 consumer 위젯 안에서만 부분적으로 랜더링한다.
            Consumer(
              builder: (context, ref, child) {
                final state5 = ref.watch(gStateNotifierProvider);
                return Row(
                  children: [
                    Text('state5 : $state5'),
                    if (child != null) child,
                  ],
                );
              },
              // child는 위에 build가 재 랜더링되어도, 초기 한번만불러오도록 할수있다.
              // 복잡하고 cost가 많이 필요한 위젯
              child: Text("hello"),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(
                        gStateNotifierProvider.notifier) // 값을 바꾸고싶을때 .notifier
                    .increment(); // 버튼 누를때 실행되는거 read
              },
              child: Text('up'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(
                        gStateNotifierProvider.notifier) // 값을 바꾸고싶을때 .notifier
                    .decrement(); //불러와서 저장
              },
              child: Text('down'),
            ),
            // invalidate 유효하지 않게 하다
            // state를 더이상 유효하지 않게해서 초기상태로 되돌림
            ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: Text('invalidate'),
            ),
          ],
        ));
  }
}
