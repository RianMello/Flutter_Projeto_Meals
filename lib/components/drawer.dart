import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomLeft,
            child: Text(
              "App Meals",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _createItem(
            Icons.restaurant_rounded,
            "Meals",
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          SizedBox(
            height: 20,
          ),
          _createItem(
            Icons.settings,
            'Settings',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
          )
        ],
      ),
    );
  }
}
