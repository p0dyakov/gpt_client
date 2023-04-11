import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gpt_client/src/feature/chat/page/chat_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: ChatRoute.page, path: '/'),
  ];
}
