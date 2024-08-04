import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:go_router_practice/screens/1_basic_screen.dart';
import 'package:go_router_practice/screens/2_named_screen.dart';
import 'package:go_router_practice/screens/3_push_screen.dart';
import 'package:go_router_practice/screens/4_pop_base_screen.dart';
import 'package:go_router_practice/screens/5_pop_return_screen.dart';
import 'package:go_router_practice/screens/6_path_param_screen.dart';
import 'package:go_router_practice/screens/7_query_parameter_screen.dart';
import 'package:go_router_practice/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return NamedScreen();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return PushScreen();
          },
        ),

        // /pop
        GoRoute(
          path: 'pop',
          builder: (context, state) {
            return PopBaseScreen();
          },
          routes: [
            // /pop/return
            GoRoute(
              path: 'return',
              builder: (context, state) {
                return PopReturnScreen();
              },
            )
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state){
                return PathParamScreen();
              }
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return QueryParameterScreen();
          },
          routes: [
            GoRoute(
                path: ':name',
                builder: (context, state) {
                  return PathParamScreen();
                }),
          ],
        ),
      ],
    ),
  ],
);
