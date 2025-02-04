import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final String gameName;
  final String description;

  const MenuItems({
    super.key,
    required this.gameName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
