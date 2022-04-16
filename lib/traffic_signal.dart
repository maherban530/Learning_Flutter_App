import 'package:flutter/material.dart';
import 'dart:async';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // int counter = 120;
  late Timer _timer;
  bool signal1 = true;
  int signal1counter = 30;
  bool signal2 = false;
  int signal2counter = 60;
   bool signal4 = false;
  int signal4counter = 90;
  bool signal3 = false;
  int signal3counter = 120;

  @override
  void initState() {
    updateCounter();
    super.initState();
  }

// Here you can write your code

  updateCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // You can also call here any function.
      if (signal1counter > 0) {
        setState(() {
          signal1counter = --signal1counter;
        });
      } else {
        setState(() {
          if (signal1 == true) {
            setState(() {
              signal1 = false;
              signal2 = true;
              if (signal1 == true) {
                signal1counter = 30;
              } else if (signal2 == true) {
                signal1counter = 120;
              } else if (signal4 == true) {
                signal1counter = 90;
              } else if (signal3 == true) {
                signal1counter = 60;
              }
            });
          }
          // else if (signal2 == true) {
          //   setState(() {
          //     signal2 = false;
          //     signal4 = true;
          //   });
          // } else if (signal4 == true) {
          //   signal4 = false;
          //   signal3 = true;
          // } else {
          //   signal3 = false;
          //   signal1 = true;
          // }
        });
      }

      if (signal2counter > 0) {
        setState(() {
          signal2counter = --signal2counter;
        });
      } else {
        setState(() {
          if (signal2 == true) {
            setState(() {
              signal2 = false;
              signal4 = true;
              if (signal2 == true) {
                signal2counter = 30;
              } else if (signal4 == true) {
                signal2counter = 120;
              } else if (signal3 == true) {
                signal2counter = 90;
              } else if (signal1 == true) {
                signal2counter = 60;
              }
            });
          }
        });
      }

      if (signal4counter > 0) {
        setState(() {
          signal4counter = --signal4counter;
        });
      } else {
        setState(() {
          if (signal4 == true) {
            setState(() {
              signal4 = false;
              
              signal3 = true;
              if (signal4 == true) {
                signal4counter = 30;
              } else if (signal3 == true) {
                signal4counter = 120;
              } else if (signal1 == true) {
                signal4counter = 90;
              } else if (signal2 == true) {
                signal4counter = 60;
              }
            });
          }
        });
      }

      if (signal3counter > 0) {
        setState(() {
          signal3counter = --signal3counter;
        });
      } else {
        setState(() {
          if (signal3 == true) {
            setState(() {
              signal3 = false;
              
              signal1 = true;
              if (signal3 == true) {
                signal3counter = 30;
              } else if (signal1 == true) {
                signal3counter = 120;
              } else if (signal2 == true) {
                signal3counter = 90;
              } else if (signal4 == true) {
                signal3counter = 60;
              }
            });
          }
        });
      }
    });
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
                            color: signal1counter<=5 ? Colors.orange: signal1 ? Colors.green : Colors.red,
                            child: Center(
                              child: Text(
                                '$signal1counter',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                            color: signal2counter<=5 ? Colors.orange: signal2 ? Colors.green : Colors.red,
                            child: Center(
                              child: Text(
                                '$signal2counter',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                            color: signal3counter<=5 ? Colors.orange: signal3 ? Colors.green : Colors.red,
                            child: Center(
                              child: Text(
                                '$signal3counter',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                            color: signal4counter<=5 ? Colors.orange: signal4 ? Colors.green : Colors.red,
                            child: Center(
                              child: Text(
                                '$signal4counter',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),         
        ],
      ),
    );
  }
}
