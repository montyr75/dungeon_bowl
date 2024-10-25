import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/characters.dart';
import 'features/app/presentation/home_page.dart';
import 'features/app/presentation/not_found_page.dart';
import 'features/characters/presentation/character_details_page.dart';
import 'features/characters/presentation/character_selection_page.dart';
import 'features/corridor/presentation/corridor_page.dart';
import 'features/fork/presesntation/fork_page.dart';
import 'features/lair/presentation/found_lair_page.dart';
import 'features/lair/presentation/lair_page.dart';
import 'features/room/presentation/room_page.dart';
import 'features/tavern/presentation/tavern_page.dart';
import 'features/treasure_room/presentation/treasure_room_page.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  characterSelectionPage,
  characterDetails,
  corridor,
  tavern,
  room,
  foundLair,
  lair,
  fork,
  treasureRoom;

  final String? _path;

  String get path => _path ?? name;

  const AppRoute([this._path]);
}

@riverpod
GoRouter goRouter(Ref ref) {
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
            name: AppRoute.characterSelectionPage.name,
            path: AppRoute.characterSelectionPage.path,
            builder: (context, state) => const CharacterSelectionPage(),
            routes: [
              GoRoute(
                name: AppRoute.characterDetails.name,
                path: AppRoute.characterDetails.path,
                builder: (context, state) =>
                    CharacterDetailsPage(character: state.extra as Character),
              ),
            ],
          ),
          GoRoute(
            name: AppRoute.corridor.name,
            path: AppRoute.corridor.path,
            builder: (context, state) => const CorridorPage(),
            routes: [
              GoRoute(
                name: AppRoute.room.name,
                path: AppRoute.room.path,
                builder: (context, state) => const RoomPage(),
              ),
              GoRoute(
                name: AppRoute.foundLair.name,
                path: AppRoute.foundLair.path,
                builder: (context, state) => const FoundLairPage(),
              ),
              GoRoute(
                name: AppRoute.lair.name,
                path: AppRoute.lair.path,
                builder: (context, state) => const LairPage(),
              ),
               GoRoute(
                name: AppRoute.tavern.name,
                path: AppRoute.tavern.path,
                builder: (context, state) => const TavernPage(),
              ),
              GoRoute(
                name: AppRoute.fork.name,
                path: AppRoute.fork.path,
                builder: (context, state) => const ForkPage(),
              ),
             GoRoute(
                name: AppRoute.treasureRoom.name,
                path: AppRoute.treasureRoom.path,
                builder: (context, state) => const TreasureRoomPage(),
              ),
            ],
          ),
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
