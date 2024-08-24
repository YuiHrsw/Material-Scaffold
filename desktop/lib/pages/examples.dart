import 'package:flutter/material.dart';

class Examples extends StatefulWidget {
  const Examples({super.key});

  @override
  ExamplesState createState() => ExamplesState();
}

class ExamplesState extends State<Examples> {
  bool _gridview = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Examples',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: colorScheme.secondary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _gridview = !_gridview;
              });
            },
            icon: Icon(
              _gridview
                  ? Icons.calendar_view_month
                  : Icons.view_agenda_outlined,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
      body: const Center(
        child: Text("Examples"),
      ),
    );
  }
}
