import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_app/traffic_signal.dart';

import 'api_get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 10.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          _borderRadius = BorderRadius.only(
            topRight: Radius.circular(Random().nextInt(200).toDouble()),
            bottomRight: Radius.circular(Random().nextInt(500).toDouble()),
            topLeft: Radius.circular(Random().nextInt(1500).toDouble()),
            bottomLeft: Radius.circular(Random().nextInt(1000).toDouble()),
          );

          // BorderRadius.circular(Random().nextInt(100).toDouble());
        });
      });
    super.initState();
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Smoke Animation"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          // child: Icon(
          //   Icons.mic,
          //   color: Colors.white,
          // ),
          decoration: BoxDecoration(
              // color: Color.fromARGB(255, 27, 28, 30),
              borderRadius: _borderRadius,
              // shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(130, 237, 125, 58),
                    blurRadius: _animation.value,
                    spreadRadius: _animation.value)
              ]),
        ),
      ),
    );
  }
}
