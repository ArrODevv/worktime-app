import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worktime/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String currentSettingsCategory = 'General';
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('$currentSettingsCategory Settings'),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                text: 'General',
                icon: Icon(Icons.settings),
              ),
              Tab(
                text: 'App Design',
                icon: Icon(Icons.color_lens),
              ),
            ],
            onTap: (index) {
              setState(() {
                switch(index) {
                  case 0:
                    currentSettingsCategory = 'General';
                    break;
                  case 1:
                    currentSettingsCategory = 'Design';
                    break;
                  default:
                    currentSettingsCategory = 'Other';
                    break;
                }
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: const Text('General Settings'),
            ),
            Center(
              child: const _DesignSettingsTab(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DesignSettingsTab extends StatefulWidget {
  // ignore: unused_element
  const _DesignSettingsTab({super.key});
  
  @override
  State<_DesignSettingsTab> createState() => _DesignSettingsTabState();
}

class _DesignSettingsTabState extends State<_DesignSettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text('Placeholder'),
              
              ElevatedButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
                child: const Text('Toggle theme'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
