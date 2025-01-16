import 'package:flutter/material.dart';

class WorktimeApp extends StatefulWidget {
  const WorktimeApp({super.key});

  @override
  State<WorktimeApp> createState() => _WorktimeAppState();
}

// TODO: fix styling
class _WorktimeAppState extends State<WorktimeApp> {
  int selectedIndex = 0;
  bool extended = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worktime'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              destinations: <NavigationRailDestination>[
                // TODO
              ],
              selectedIndex: selectedIndex,
              extended: extended,
              onDestinationSelected: (i) {
                if(i != selectedIndex) {
                  setState(() {
                    selectedIndex = i;
                  });
                } else {
                  setState(() {
                    extended = !extended;
                  });
                }
              },
            ),
            
            if(selectedIndex == 0)
              const Text('Page 1')
            else
              const Text('Page 2'),
          ],
        ),
      ),
    );
  }
}
