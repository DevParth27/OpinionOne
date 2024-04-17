import 'package:flutter/material.dart';

PreferredSizeWidget buildCustomAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Enhanced App Bar',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.blue,
    elevation: 0.0,
    actions: [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          // Implement search functionality
        },
      ),
      IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {
          // Implement notification functionality
        },
      ),
      PopupMenuButton<String>(
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem<String>(
              value: 'Settings',
              child: Text('Settings'),
            ),
            const PopupMenuItem<String>(
              value: 'Help',
              child: Text('Help'),
            ),
          ];
        },
        onSelected: (String value) {
          // Handle selection from the popup menu
        },
      ),
    ],
  );
}
