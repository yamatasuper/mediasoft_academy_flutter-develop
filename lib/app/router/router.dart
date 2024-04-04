import 'package:auto_route/auto_route.dart';
import 'package:mediasoft_academy_flutter/main.dart';
import 'package:mediasoft_academy_flutter/presentation/faq/ui/faq_page.dart';
import 'package:mediasoft_academy_flutter/presentation/login/ui/login_page.dart';
import 'package:mediasoft_academy_flutter/presentation/schedules_main_screen/ui/schedules_main_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/'),
        AutoRoute(page: StartRoute.page,),
        AutoRoute(page: SchedulesMainRoute.page),
        AutoRoute(page: FaqRoute.page)
      ];
}
