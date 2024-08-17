import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
        ),
        actions: [
          IconButton(
            tooltip: 'Edit',
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
      body: const Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
