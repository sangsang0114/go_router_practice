import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/layout/default_layout.dart';

class QueryParameterScreen extends StatelessWidget {
  const QueryParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text(
            'Query Parameter : ${GoRouterState.of(context).queryParameters}',
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Query parameter'),
          ),
        ],
      ),
    );
  }
}
