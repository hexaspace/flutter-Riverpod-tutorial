import 'package:flutter_riverpod/flutter_riverpod.dart';

// 생성하는 순간 변수입력해서 provider안의 로직을 변경해야할 때 사용
//<리턴값, data타입> ((ref, data){})
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
  // return [1, 2, 3, 4];
});
