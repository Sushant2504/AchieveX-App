import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class PremiumContentDialog extends StatelessWidget {
  const PremiumContentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Premium Content'),
      content: const Text('This feature is only available for premium subscribers. Would you like to upgrade your subscription?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Add logic to navigate to subscription screen or show subscription options
          Navigator.pushNamed(context, RoutesName.subscriptionScreen);
          },
          child: const Text('Upgrade'),
        ),
      ],
    );
  }
}