import 'package:flutter/material.dart';
import 'dart:async';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int counter = 5;
  late Timer _timer;
  bool signal1 = true;
  bool signal2 = false;
  bool signal3 = false;
  bool signal4 = false;

  @override
  void initState() {
    updateCounter();
    super.initState();
  }

// Here you can write your code

  updateCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // You can also call here any function.
      if (counter > 0) {
        setState(() {
          counter = --counter;
        });
      } else {
        setState(() {
          counter = 5;
          if (signal1 == true) {
            setState(() {
              signal1 = false;
              signal2 = true;
            });
          } else if (signal2 == true) {
            setState(() {
              signal2 = false;
              signal4 = true;
            });
          } else if (signal4 == true) {
            signal4 = false;
            signal3 = true;
          } else {
            signal3 = false;
            signal1 = true;
          }
        });
      }
    });
  }

  stopCounter() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Traffic Signal Flow")),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blueGrey.shade100,
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: signal1 ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blueGrey.shade200,
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: signal2 ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blueGrey.shade200,
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: signal3 ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blueGrey.shade100,
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: signal4 ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  '$counter',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // TweenAnimationBuilder<Duration>(
            //     onEnd: () {
            //       // setState(() {
            //       //   second = 10;
            //       // });
            //       // _animationController.forward();

            //       if (signal1 == true) {
            //         setState(() {
            //           // endDuration = const Duration(seconds: 10);

            //           second = const Duration(seconds: 10);
            //           signal1 = false;
            //           signal2 = true;
            //         });
            //       } else if (signal2 == true) {
            //         setState(() {
            //           second = const Duration(seconds: 10);

            //           signal2 = false;
            //           signal3 = true;
            //         });
            //       } else if (signal3 == true) {
            //         signal3 = false;
            //         signal4 = true;
            //       }
            //     },
            //     duration: second,
            //     tween: Tween(begin: endDuration, end: second),
            //     builder:
            //         (BuildContext context, Duration second, Widget? child) {
            //       // final hour = value.inHours;

            //       final minutes = second.inMinutes % 60;
            //       final seconds = second.inSeconds % 60;

            //       return Center(
            //           child: Text(
            //         '$minutes:$seconds',
            //         textAlign: TextAlign.center,
            //         style: const TextStyle(fontWeight: FontWeight.bold),
            //       ));
            //     }),
            // )
          ),
        ],
      ),
//     );
      //     Center(
      //         child: Column(children: <Widget>[
      //   Container(
      //       padding: EdgeInsets.fromLTRB(18, 18, 18, 18),
      //       child: Text('$counter', style: TextStyle(fontSize: 100))),
      //   Container(
      //       margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      //       child: RaisedButton(
      //         onPressed: () => updateCounter(),
      //         child: Text(
      //           'Click Here To Call A Recurring Function in Flutter',
      //           style: TextStyle(fontSize: 24),
      //           textAlign: TextAlign.center,
      //         ),
      //         textColor: Colors.white,
      //         color: Colors.green,
      //         padding: EdgeInsets.fromLTRB(11, 11, 11, 11),
      //       )),
      //   Container(
      //       margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      //       child: RaisedButton(
      //         onPressed: () => stopCounter(),
      //         child: Text(
      //           'Click Here To Stop Recurring Function From Calling',
      //           style: TextStyle(fontSize: 24),
      //           textAlign: TextAlign.center,
      //         ),
      //         textColor: Colors.white,
      //         color: Colors.green,
      //         padding: EdgeInsets.fromLTRB(11, 11, 11, 11),
      //       )),
      // ]))
    );
  }
}
