import 'package:flutter/material.dart';

import '../components/drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.onSettingsChanged, this.settings);

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settingsState;

  @override
  void initState() {
    super.initState();
    settingsState = widget.settings;
  }

  _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settingsState!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: const DrawerComponent(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Configurações'),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem Glutém',
                'Só exibe refeições sem glutém!',
                settingsState!.isGlutenFree,
                (value) => setState(() => settingsState!.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose!',
                settingsState!.isLactoseFree,
                (value) => setState(() => settingsState!.isLactoseFree = value),
              ),
              _createSwitch(
                'Veganas',
                'Só exibe refeições veganas',
                settingsState!.isVegan,
                (value) => setState(() => settingsState!.isVegan = value),
              ),
              _createSwitch(
                'Vegetarianas',
                'Só exibe refeições vegetarianas',
                settingsState!.isVegetarian,
                (value) => setState(() => settingsState!.isVegetarian = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
