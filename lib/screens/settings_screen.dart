import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  const SettingScreen(this.onSettingsChanged);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var settings = Settings();

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutem',
                  'Só exibe refeições sem gluttem',
                  settings.isGlutenFree,
                  (value) {
                    setState(() => settings.isGlutenFree = value);
                  },
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem Lactose',
                  settings.isLactoseFree,
                  (value) {
                    setState(() => settings.isLactoseFree = value);
                  },
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições Veganas',
                  settings.isVegan,
                  (value) {
                    setState(() => settings.isVegan = value);
                  },
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições Vegetarianas',
                  settings.isVegetarian,
                  (value) {
                    setState(() => settings.isVegetarian = value);
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
