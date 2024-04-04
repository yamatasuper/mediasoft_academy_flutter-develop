import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediasoft_academy_flutter/app/l10n/app_localizations.dart';
import 'package:mediasoft_academy_flutter/app/l10n/l10n.dart';
import 'package:mediasoft_academy_flutter/app/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mediasoft_academy_flutter/presentation/faq/ui/faq_page.dart';
import 'package:mediasoft_academy_flutter/presentation/schedules_main_screen/ui/schedules_main_page.dart';
import 'presentation/schedules_main_screen/bloc/schedulesmainscreen_bloc.dart';

Future<void> main() async {
  runApp(
    SizedBox(
      child: Image.asset(
        'assets/splash/splash.png',
        fit: BoxFit.cover,
      ),
    ),
  );
  await Future.delayed(const Duration(seconds: 2));
  runApp(ProviderScope(observers: const [], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.config(),
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) {
                L10n.init(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child ?? const SizedBox.shrink(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

@RoutePage()
class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    BlocProvider<SchedulesMainScreenBloc>(
      create: (BuildContext context) => SchedulesMainScreenBloc(),
      child: const SchedulesMainPage(),
    ),
    const FaqPage(),
    const Text(
      'Мое',
      style: optionStyle,
    ),
    const Text(
      'Чат',
      style: optionStyle,
    ),
    const Text(
      'Профиль',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void hideElementAfter3Seconds() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    hideElementAfter3Seconds();
    return Scaffold(
      appBar: const AppBarWidget(title: 'Наши курсы'),
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Курсы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_sharp),
            label: 'Лента',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Мое',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  @override
  final Size preferredSize;

  const AppBarWidget({
    Key? key,
    required this.title,
  })  : preferredSize = const Size.fromHeight(56),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(68, 68, 68, 1),
      foregroundColor: Colors.black,
      leading: Text(
        title,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: 22.0,
          color: Colors.white,
        ),
      ),
      leadingWidth: 280,
    );
  }
}
