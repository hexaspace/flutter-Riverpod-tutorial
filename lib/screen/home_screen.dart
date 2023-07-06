import 'package:flutter/material.dart';
import 'package:flutter_riverpod_tutorial/layout/default_layout.dart';
import 'package:flutter_riverpod_tutorial/screen/auto_dispose_modifier_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/code_generation_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/family_modifier_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/future_provider_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/listen_provider_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/provider_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/select_provider_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/state_notifier_provider_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/state_provider_screen.dart';
import 'package:flutter_riverpod_tutorial/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Home Screen",
      body: ListView(children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StateProviderScreen(),
                ),
              );
            },
            child: Text('state provider screen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StateNotifierProviderScreen(),
                ),
              );
            },
            child: Text('StateNotifierProviderScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FutureProvidorScreen(),
                ),
              );
            },
            child: Text('FutureProvidorScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StreamProviderScreen(),
                ),
              );
            },
            child: Text('StreamProviderScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FamilyModifierScreen(),
                ),
              );
            },
            child: Text('FamilyModifierScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AutoDisposeModifierScreen(),
                ),
              );
            },
            child: Text('AutoDisposeModifierScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ListenProviderScreen(),
                ),
              );
            },
            child: Text('ListenProviderScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SelectProviderScreen(),
                ),
              );
            },
            child: Text('SelectProviderScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProvidorScreen(),
                ),
              );
            },
            child: Text('ProvidorScreen')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CodeGenerationScreen(),
                ),
              );
            },
            child: Text('CodeGenerationScreen')),
      ]),
    );
  }
}
