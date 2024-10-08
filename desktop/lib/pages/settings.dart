import 'package:desktop/backend/storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Settings',
      //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
      //   ),
      // ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Theme',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: colorScheme.secondary,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.color_lens_outlined),
            title: const Text('Theme color'),
            trailing: SizedBox(
              height: 40,
              width: 140,
              child: DropdownButtonFormField(
                // icon: const SizedBox(),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  fillColor: Theme.of(context).colorScheme.secondaryContainer,
                ),
                value: AppStorage().settings.themeCode,
                items: List.generate(AppStorage().colors.length, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Row(
                      children: [
                        ColoredBox(
                          color: AppStorage().colors[index],
                          child: const SizedBox(
                            height: 16,
                            width: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(AppStorage().themes[index]),
                      ],
                    ),
                  );
                }),
                onChanged: (value) {
                  AppStorage().settings.themeCode = value!;
                  AppStorage().saveSettings();
                  AppStorage().updateStatus();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SwitchListTile(
              title: const Row(
                children: [
                  Icon(
                    Icons.brightness_auto_outlined,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Follow system theme mode')
                ],
              ),
              value: AppStorage().settings.themeMode == ThemeMode.system,
              onChanged: (bool value) {
                if (value) {
                  setState(() {
                    AppStorage().settings.themeMode = ThemeMode.system;
                  });
                } else {
                  setState(() {
                    AppStorage().settings.themeMode =
                        Theme.of(context).brightness == Brightness.dark
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  });
                }
                AppStorage().saveSettings();
                AppStorage().updateStatus();
              }),
          const SizedBox(
            height: 8,
          ),
          AppStorage().settings.themeMode == ThemeMode.system
              ? const SizedBox()
              : SwitchListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.dark_mode_outlined,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Dark mode')
                    ],
                  ),
                  value: AppStorage().settings.themeMode == ThemeMode.dark,
                  onChanged: (bool value) {
                    if (value) {
                      setState(() {
                        AppStorage().settings.themeMode = ThemeMode.dark;
                      });
                    } else {
                      setState(() {
                        AppStorage().settings.themeMode = ThemeMode.light;
                      });
                    }
                    AppStorage().saveSettings();
                    AppStorage().updateStatus();
                  },
                ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Storage',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: colorScheme.secondary,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              launchUrl(Uri.directory(AppStorage().dataPath));
            },
            leading: const Icon(Icons.folder_outlined),
            title: const Text('Open data folder'),
            subtitle: Text(AppStorage().dataPath),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              'About',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: colorScheme.secondary,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.open_in_new_rounded,
            ),
            title: const Text('Material Scaffold'),
            trailing: const Text(
              'v 1.0',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              launchUrl(Uri.https('github.com', '/YuiHrsw/Material-Scaffold'));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.open_in_new_rounded,
            ),
            title: const Text('Flutter'),
            trailing: const Text(
              'v 3.24.1',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              launchUrl(Uri.https('flutter.dev'));
            },
          )
        ],
      ),
    );
  }
}
