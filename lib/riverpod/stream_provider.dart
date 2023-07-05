import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield List.generate(3, (index) => index * i);
    // 3은 length, 3개의 숫자를 i와 곱해서 반환,  [0,1,2],[0,2,4],[0,3,6]...
  }
});
