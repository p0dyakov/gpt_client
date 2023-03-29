import 'package:ai_client/src/feature/chat/page/chat_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<void>(page: ChatPage, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}

// class PlaceholderPage extends StatelessWidget {
//   const PlaceholderPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) => const Scaffold(
//         body: Center(
//           child: Text('Placeholder page'),
//         ),
//       );
// }
