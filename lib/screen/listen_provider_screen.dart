import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/layout/default_layout.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

// ConsumerState 에서 ref도 제공
class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  // vsync: this 를 위해 with TickerProviderStateMixin 추가
  late final TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
