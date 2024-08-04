import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: Text('Go Basic'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named_screen');
            },
            child: Text('Go Named'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/push');
            },
            child: Text('Go push'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/pop');
            },
            child: Text('Go pop'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/123');
            },
            child: Text('Go path param'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {
                    'name': 'test',
                    'age': '32',
                  },
                ).toString(),
              );
            },
            child: Text('Go query param'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/nested/a');
            },
            child: Text('Go nested'),
          ),
        ],
      ),
    );
  }
}
