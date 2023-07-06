import 'package:flutter_riverpod/flutter_riverpod.dart';

// future 비슷한 방식인데 캐싱이 안됨.
// 의미 = 자동으로 삭제한다 (캐시를)
final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>(
  (ref) async {
    await Future.delayed(Duration(seconds: 2));

    return [1, 2, 3, 4];
  },
);
