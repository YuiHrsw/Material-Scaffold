import 'package:flutter/material.dart';

class Examples extends StatefulWidget {
  const Examples({super.key});

  @override
  ExamplesState createState() => ExamplesState();
}

class ExamplesState extends State<Examples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Examples',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
        ),
      ),
      body: const Center(
        child: Text("Examples"),
      ),
    );
  }
}
