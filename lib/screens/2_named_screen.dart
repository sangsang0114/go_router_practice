import 'package:flutter/material.dart';
import 'package:go_router_practice/layout/default_layout.dart';

class NamedScreen extends StatelessWidget {
  const NamedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Text(
          'named Screen',
        ),
      ),
    );
  }
}