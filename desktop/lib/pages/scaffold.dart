import 'package:desktop/backend/storage.dart';
import 'package:desktop/pages/dashboard.dart';
import 'package:desktop/pages/examples.dart';
import 'package:desktop/pages/settings.dart';
import 'package:desktop/pages/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _currentPageIndex = 0;
  final _dashboardKey = GlobalKey<NavigatorState>();
  final _widgetsKey = GlobalKey<NavigatorState>();
  final _examplesKey = GlobalKey<NavigatorState>();
  final _settingsKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: _currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          trailing: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: 'Change theme mode',
                    hoverColor: colorScheme.primaryContainer,
                    iconSize: 28,
                    icon: Theme.of(context).brightness == Brightness.dark
                        ? const Icon(Icons.wb_sunny)
                        : const Icon(Icons.dark_mode),
                    onPressed: () {
                      setState(() {
                        AppStorage().settings.themeMode =
                            Theme.of(context).brightness == Brightness.dark
                                ? ThemeMode.light
                                : ThemeMode.dark;
                      });
                      AppStorage().saveSettings();
                      AppStorage().updateStatus();
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  )
                ],
              ),
            ),
          ),
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              padding: EdgeInsets.symmetric(vertical: 4),
              icon: Icon(
                Icons.home_filled,
                size: 28,
              ),
              label: Text('Dashboard'),
            ),
            NavigationRailDestination(
              padding: EdgeInsets.symmetric(vertical: 4),
              icon: Icon(
                Icons.widgets,
                size: 28,
              ),
              label: Text('Widgets'),
            ),
            NavigationRailDestination(
              padding: EdgeInsets.symmetric(vertical: 4),
              icon: Icon(
                Icons.explore,
                size: 28,
              ),
              label: Text('Examples'),
            ),
            NavigationRailDestination(
              padding: EdgeInsets.symmetric(vertical: 4),
              icon: Icon(
                Icons.filter_vintage,
                size: 28,
              ),
              label: Text('Settings'),
            ),
          ],
        ),
        Expanded(
          child: IndexedStack(
            index: _currentPageIndex,
            children: [
              Navigator(
                key: _dashboardKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => const Dashboard(),
                ),
              ),
              Navigator(
                key: _widgetsKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => const Widgets(),
                ),
              ),
              Navigator(
                key: _examplesKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => const Examples(),
                ),
              ),
              Navigator(
                key: _settingsKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => const Settings(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
