import 'package:flutter/material.dart';

class Widgets extends StatefulWidget {
  const Widgets({super.key});

  @override
  WidgetsState createState() => WidgetsState();
}

class WidgetsState extends State<Widgets> {
  bool _gridview = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Widgets',
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
        child: Text("Widgets"),
      ),
    );
  }
}
