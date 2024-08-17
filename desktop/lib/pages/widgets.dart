import 'package:flutter/material.dart';

class Widgets extends StatefulWidget {
  const Widgets({super.key});

  @override
  WidgetsState createState() => WidgetsState();
}

class WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Widgets',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
        ),
      ),
      body: const Center(
        child: Text("Widgets"),
      ),
    );
  }
}
