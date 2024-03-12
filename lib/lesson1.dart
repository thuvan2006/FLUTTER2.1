import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'o7planning.org',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double _value = 0;
  bool _working = false;

  void startWorking() async {
    setState(() {
      _working = true;
      _value = 0;
    });
    for (int i = 0; i < 10; i++) {
      if (!_working) {
        break;
      }
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _value += 0.1;
      });
    }
    setState(() {
      _working = false;
    });
  }

  void stopWorking() {
    setState(() {
      _working = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flutter CircularProgressIndicator Example'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: _value,
            backgroundColor: Colors.cyanAccent,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        Text(
          "Percent: ${(_value * 100).round()}%",
          style: const TextStyle(fontSize: 20),
        ),
        ElevatedButton(
            onPressed: _working
                ? null
                : () {
                    startWorking();
                  },
            child: const Text("Start")),
        ElevatedButton(
            onPressed: !_working
                ? null
                : () {
                    stopWorking();
                  },
            child: const Text("Stop"))
      ])),
    );
  }
}
