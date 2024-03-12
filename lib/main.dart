import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final int _counter = 0;

  //void _incrementCounter() {
  //setState(() {
  // This call to setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values. If we changed
  // _counter without calling setState(), then the build method would not be
  // called again, and so nothing would appear to happen.
  //_counter++;
  // });
  //}
  int currentPage = 0;
  final Widget _myContacts = const MyContacts();
  final Widget _myEmails = const MyEmails();
  final Widget _myProfile = const MyProfile();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    FancyBottomNavigation a;
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
        title: const Text("FancyBottomNavigation Example"),
      ),
      body: Container(
        color: Colors.black12,
        constraints: const BoxConstraints.expand(),
        child: getPage(),
      ),
    );
  }

  Widget getPage() {
    if (currentPage == 0) {
      return _myContacts;
    } else if (currentPage == 1) {
      return _myEmails;
    } else {
      return _myProfile;
    }
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile"));
  }
}

class MyEmails extends StatelessWidget {
  const MyEmails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Emails"));
  }
}

class MyContacts extends StatelessWidget {
  const MyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Contacts"));
  }
}
