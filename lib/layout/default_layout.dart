import "package:flutter/material.dart";

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions; // 앱바 오른쪽 끝에 들어가는것. 필수적이지 않음
  const DefaultLayout({
    required this.title,
    required this.body,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: actions,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: body,
        ));
  }
}
