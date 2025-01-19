import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:worktime/pages/home.dart';
import 'package:worktime/pages/time_tracking.dart';

void main() {
  runApp(const WorktimeApp());
}

class WorktimeApp extends StatefulWidget {
  const WorktimeApp({super.key});
  
  @override
  State<WorktimeApp> createState() => _WorktimeAppState();
}

class _WorktimeAppState extends State<WorktimeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worktime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber, brightness: Brightness.dark),
      ),
      home: const AppScaffold(),
    );
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});
  
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int navIndex = 0;
  bool navExtended = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worktime'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            setState(() {
              navExtended = !navExtended;
            });
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: const Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.abc_rounded),
                  label: const Text('Placeholder'),
                ),
              ],
              selectedIndex: navIndex,
              extended: navExtended,
              onDestinationSelected: (i) {
                if(navIndex == i) {
                  setState(() {
                    navExtended = !navExtended;
                  });
                } else {
                  setState(() {
                    navIndex = i;
                  });
                }
              },
            ),
            
            Expanded(
              child: switch(navIndex) {
                0 => const HomePage(),
                1 => const TimeTrackingPage(),
                _ => Text('Unimpl.'),
              },
            ),
          ],
        ),
      ),
    );
  }
}
