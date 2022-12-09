import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Battery status app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var battery = Battery();
  int batteryLevel = 0;

  checkbatteryLevel() async {
    final batteryLevelInstance = await Battery().batteryLevel;

    setState(() {
      batteryLevel = batteryLevelInstance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (batteryLevel != 0)
              Text(
                "Your battery level is $batteryLevel",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ElevatedButton(
                onPressed: () async {
                  checkbatteryLevel();
                },
                child:
                    const Text('Click here to display your battery percentage'))
          ],
        ),
      ),
    );
  }
}
