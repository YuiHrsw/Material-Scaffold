import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Dashboard',
      //     style: TextStyle(
      //       fontWeight: FontWeight.w500,
      //       fontSize: 26,
      //       color: Theme.of(context).colorScheme.primary,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       tooltip: 'Edit',
      //       onPressed: () {},
      //       icon: const Icon(Icons.edit),
      //     ),
      //     const SizedBox(
      //       width: 6,
      //     ),
      //   ],
      // ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Resources',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 160),
                  child: CarouselView(
                    itemExtent: 200,
                    shrinkExtent: 100,
                    children: List<Widget>.generate(20, (int index) {
                      return UncontainedLayoutCard(
                          index: index, label: 'Item $index');
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.play_circle_outline_rounded,
                  ),
                  title: const Text('Playboy Player'),
                  subtitle: const Text('Material 3 style media player'),
                  trailing: const Icon(
                    Icons.open_in_new_rounded,
                  ),
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://github.com/Playboy-Player/Playboy'),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.bar_chart_rounded,
                  ),
                  title: const Text('CF Partner'),
                  subtitle:
                      const Text('Competitive programming tools collections'),
                  trailing: const Icon(
                    Icons.open_in_new_rounded,
                  ),
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://github.com/YuiHrsw/CF-Partner'),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}
