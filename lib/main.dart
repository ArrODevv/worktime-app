import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worktime/pages/settings_page.dart';
import 'package:worktime/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: Worktime(),
  ));
}

class Worktime extends StatelessWidget {
  const Worktime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worktime',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int navigationIndex = 0;
  bool extended = false;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (navigationIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = AnalyticsPage();
        break;
      // case 2:
      //   // no page, opens new view
      default:
        throw UnimplementedError('No widget for index $navigationIndex.');
    }

    return Scaffold(
        body: Row(
      children: [
        SafeArea(
          child: NavigationRail(
            extended: extended,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.area_chart),
                label: Text('Analysis'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
            selectedIndex: navigationIndex,
            onDestinationSelected: (value) {
              if (navigationIndex == value) {
                setState(() {
                  extended = !extended;
                });
              } else if (value == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              } else {
                setState(() {
                  navigationIndex = value;
                });
              }
            },
          ),
        ),
        Expanded(
          child: Container(
            color: Provider.of<ThemeProvider>(context, listen: false)
                .themeData
                .colorScheme
                .primaryContainer,
            child: page,
          ),
        ),
      ],
    ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hello, World!'),
      ],
    );
  }
}

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Analytics go here...'),
      ],
    );
  }
}
