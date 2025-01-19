import 'package:flutter/material.dart';

class TimeTrackingPage extends StatefulWidget {
  const TimeTrackingPage({super.key});
  
  @override
  State<TimeTrackingPage> createState() => _TimeTrackingPageState();
}

class _TimeTrackingPageState extends State<TimeTrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Time-Tracking page'),
    );
  }
}
