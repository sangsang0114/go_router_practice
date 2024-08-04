import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/screens/10_transition_screen_1.dart';
import 'package:go_router_practice/screens/10_transition_screen_2.dart';
import 'package:go_router_practice/screens/11_error_screen.dart';
import 'package:go_router_practice/screens/1_basic_screen.dart';
import 'package:go_router_practice/screens/2_named_screen.dart';
import 'package:go_router_practice/screens/3_push_screen.dart';
import 'package:go_router_practice/screens/4_pop_base_screen.dart';
import 'package:go_router_practice/screens/5_pop_return_screen.dart';
import 'package:go_router_practice/screens/6_path_param_screen.dart';
import 'package:go_router_practice/screens/7_query_parameter_screen.dart';
import 'package:go_router_practice/screens/8_nested_child_screen.dart';
import 'package:go_router_practice/screens/8_nested_screen.dart';
import 'package:go_router_practice/screens/9_login_screen.dart';
import 'package:go_router_practice/screens/9_private_screen.dart';
import 'package:go_router_practice/screens/root_screen.dart';

bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    if (state.location == '/login/private' && authState == false) {
      return '/login'; //해당 라우트로 이동
      // return null; // 원래 이동하려던 라우트로 이동한다.
    }
    return null;
  },
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
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) {
            return LoginScreen();
          },
          routes: [
            GoRoute(path: 'private', builder: (_, state) => PrivateScreen())
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) {
            return LoginScreen();
          },
          routes: [
            GoRoute(
                path: 'private',
                builder: (_, state) => PrivateScreen(),
                redirect: (context, state) {
                  if (!authState) {
                    return '/login2';
                  } else {
                    return null;
                  }
                })
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (context, state) {
            return TransitionScreenOne();
          },
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (_, state) => CustomTransitionPage(
                transitionDuration: Duration(seconds: 3),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                  // return ScaleTransition(
                  //   scale: animation,
                  //   child: child,
                  // );

                  // return FadeTransition(
                  //   opacity: animation,
                  //   child: child,
                  // );
                },
                child: TransitionScreenTwo(),
              ),
            )
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
  debugLogDiagnostics: true,
);
