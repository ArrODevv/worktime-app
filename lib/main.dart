import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 0;
  bool navExtended = false;
  
  late Widget page;
  
  @override
  Widget build(BuildContext context) {
    setState(() {
      page = switch(navIndex) {
        0 => const HomePage(),
        1 => Text('placeh.'),
        _ => Text('Unimpl.'),
      };
    });
    
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
              destinations: [
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
            
            page,
          ],
        ),
      ),
    );
  }
}
