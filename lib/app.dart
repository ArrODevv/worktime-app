import 'package:flutter/material.dart';

class WorktimeApp extends StatefulWidget {
  const WorktimeApp({super.key});

  @override
  State<WorktimeApp> createState() => _WorktimeAppState();
}

class _WorktimeAppState extends State<WorktimeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Test Dialog'),
                    content: const Text('Lorem ipsum dolor sit amet.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Ok');
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Open Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
