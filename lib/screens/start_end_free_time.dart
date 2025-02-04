import 'package:achievex/ui/theme.dart';
import 'package:flutter/material.dart';

class StratEndFreeTimeScreen extends StatefulWidget {
  const StratEndFreeTimeScreen({super.key});

  @override
  State<StratEndFreeTimeScreen> createState() => _StratEndFreeTimeScreenState();
}

class _StratEndFreeTimeScreenState extends State<StratEndFreeTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.accentColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("Your free time started you can explore all features")],
      ),
    );
  }
}
