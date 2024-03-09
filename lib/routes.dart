import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/app/presentation/home_page.dart';
import 'features/app/presentation/not_found_page.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  characterSelector,
  characterDetails,
  corridor;

  final String? _path;

  String get path => _path ?? name;

  const AppRoute([this._path]);
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: false,
    initialLocation: AppRoute.home.path,
    observers: [FlutterSmartDialog.observer],
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: AppRoute.characterSelector.name,
            path: AppRoute.characterSelector.path,
            builder: (context, state) => const Placeholder(),
            routes: [
              GoRoute(
                name: AppRoute.characterDetails.name,
                path: AppRoute.characterDetails.path,
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          // GoRoute(
          //   name: AppRoute.thePit.name,
          //   path: AppRoute.thePit.path,
          //   builder: (context, state) => const PitPage(),
          // ),
          // GoRoute(
          //   name: AppRoute.recordSheet.name,
          //   path: AppRoute.recordSheet.path,
          //   pageBuilder: (context, state) {
          //     return MaterialPage(
          //       key: state.pageKey,
          //       fullscreenDialog: true,
          //       child: const RecordSheetPage(),
          //     );
          //   },
          // ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}
