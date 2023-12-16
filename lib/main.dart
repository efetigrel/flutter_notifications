import 'package:flutter/material.dart';
import 'package:flutter_notifications/notification_helper.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.initialize();
  tz.initializeTimeZones();
  runApp(
    MaterialApp(
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showNotification();
          },
          child: Text('Show Notification'),
        ),
      ),
    );
  }

  Future<void> _showNotification() async {
    await NotificationHelper.showNotification(
      title: 'Gökbörü Efe',
      body: 'Tığrel',
      payload: 'payload',
    );
  }
}
