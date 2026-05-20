import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Container(
              width: 253,
              height: 280,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 33),
                    child: Row(
                      children: [
                        Container(width: 50, height: 50, color: Colors.red),
                        const SizedBox(width: 16),
                        Container(width: 50, height: 50, color: Colors.green),
                        const SizedBox(width: 16),
                        Container(width: 50, height: 50, color: Colors.blue),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(width: 50, height: 100, color: Colors.purple),
                          const SizedBox(width: 16),
                          Container(width: 50, height: 100, color: Colors.cyan),
                          const SizedBox(width: 16),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(width: 50, height: 50, color: Colors.purple),
                              const SizedBox(height: 8),
                              Container(width: 50, height: 50, color: Colors.cyan),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 74),
                    child: Container(
                      width: 100,
                      height: 66,
                      color: Colors.grey,
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Container(width: 50, height: 50, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
