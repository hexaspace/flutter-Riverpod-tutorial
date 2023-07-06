import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // 3가지 기능 존재
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print(
        "[povider updated]  provider: $provider / pv : $previousValue / nv : $newValue");
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    print("[povider ADDED]  provider: $provider / valee : $value");
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    print("[povider DISPOSE]  provider: $provider ");
  }
}
