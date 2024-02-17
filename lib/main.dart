import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

void main(List<String> args, [bool launchedFromAlarm = false]) {
  print(args);
  runApp(MainApp(launchedFromAlarm: launchedFromAlarm));
}

class MainApp extends StatelessWidget {
  final bool launchedFromAlarm;

  const MainApp({super.key, required this.launchedFromAlarm});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Alarm Manager')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  AndroidAlarmManager.periodic(
                    const Duration(minutes: 1),
                    0,
                    StaticClass.printHello,
                    startAt: DateTime.now(),
                  );
                },
                child: const Text('Schedule for next minute'),
              ),
              if (launchedFromAlarm) const Text('Launched from alarm'),
            ],
          ),
        ),
      ),
    );
  }
}

class StaticClass {
  @pragma('vm:entry-point')
  static void printHello() {
    print('Hello, world!');

    main([], true);
  }
}
