import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 provider를 사용할지 결정할 고민 할 필요없도록

final _testProvider = Provider<String>((ref) => "hello code generation");

@riverpod
String gState(GStateRef ref) {
  return 'hello code generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 10;
}

// 위 코드 작성 후, 터미널에서 flutter pub run build_runner build 를 실행 하면  GStateProvider를 생성한다.
// 위에 두개는 autodispodse가 적용됨. 캐시하기 위해선 다음코드
@Riverpod(
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 20;
}

// 2) parameter > family provider의 파라미터를 일반 함수처럼 사용할수 있도록

